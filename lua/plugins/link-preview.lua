--- Lookup table of image file extensions for fast membership testing.
---@type table<string, boolean>
local image_extensions = { png = true, jpg = true, jpeg = true, gif = true, webp = true, bmp = true, svg = true }

--- Returns true if the given path has an image file extension.
---@param path string
---@return boolean
local function is_image_path(path)
  local ext = path:match("%.(%w+)$")
  return ext and image_extensions[ext:lower()]
end

--- Returns the URL and whether it is an image under the cursor.
--- Detection order:
---   1. Treesitter `inline_link` / `image` nodes  ([text](url) and ![alt](url))
---   2. Treesitter `uri_autolink` nodes            (<https://...>)
---   3. Bare URL pattern fallback                  (covers headers and plain text)
---@return string|nil url
---@return boolean is_image
local function get_link_under_cursor()
  local node = vim.treesitter.get_node()

  if node then
    -- Walk up to find inline_link or image
    local target = node
    local maxDepth = 3
    local depth = 0
    while target and depth < maxDepth do
      local t = target:type()
      if t == "inline_link" or t == "image" then break end
      target = target:parent()
      depth = depth + 1
    end

    if target then
      local is_image = target:type() == "image"
      for child in target:iter_children() do
        if child:type() == "link_destination" then
          return vim.treesitter.get_node_text(child, 0), is_image
        end
      end
    end
    -- don't know this
    -- -- 2. Check for <https://...> autolink nodes
    -- local autolink = node
    -- while autolink do
    --   if autolink:type() == "uri_autolink" then
    --     local text = vim.treesitter.get_node_text(autolink, 0)
    --     return text:match("^<(.-)>$") or text, false
    --   end
    --   autolink = autolink:parent()
    -- end
  end

  -- 3. Fallback: bare URL at cursor position (covers headers and plain text)
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local search_start = 1

  while true do
    local s, e, url = line:find("(https?://[%w%.%-%_~:/?#%[%]@!$&'()*+,;=%%]+)", search_start)
    if not s then break end
    if col >= s and col <= e then return url, false end
    search_start = e + 1
  end
end

--- Opens a markdown-highlighted floating preview window with the given lines.
---@param lines string[]
local function show_float(lines)
  vim.lsp.util.open_floating_preview(lines, "markdown", {
    border = "rounded",
    max_width = 70,
    max_height = 15,
    focusable = false,
  })
end

--- Renders a local image file in a floating window using image.nvim.
--- The window closes automatically when the cursor moves.
---@param path string Absolute path to the image file
local function show_image(path)
  local api = require("image")

  local width = 60
  local height = 20

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })

  local img = api.from_file(path, {
    window = win,
    buffer = buf,
    with_virtual_padding = true,
  })

  img:render()

  vim.api.nvim_create_autocmd("CursorMoved", {
    once = true,
    callback = function()
      img:clear()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
end

--- Downloads a remote image to a temp file and renders it with show_image.
---@param url string Remote image URL
local function show_remote_image(url)
  local curl = require("plenary.curl")
  local ext = url:match("%.(%w+)%??") or "png"
  local tmp = vim.fn.tempname() .. "." .. ext

  curl.get(url, {
    output = tmp,
    callback = function(response)
      vim.schedule(function()
        if response.status == 200 then
          show_image(tmp)
        end
      end)
    end,
  })
end

--- Extracts the `content` attribute of a meta tag matched by attr_value.
--- Handles both attribute orderings:
---   <meta name="X" content="Y">  and  <meta content="Y" name="X">
---@param html string Raw HTML string
---@param attr_value string Attribute fragment to match, e.g. `name="description"`
---@return string|nil
local function get_meta_content(html, attr_value)
  local p1 = "<meta%s+[^>]*" .. attr_value .. '[^>]*content="([^"]+)"'
  local p2 = '<meta%s+content="([^"]+)"%s+[^>]*' .. attr_value
  return html:match(p1) or html:match(p2)
end

--- Per-URL preview cache. Values are `{ image_url = string }` or `{ lines = string[] }`.
---@type table<string, { image_url: string }|{ lines: string[] }>
local cache = {}

--- Fetches a remote URL and previews it.
--- Shows the og:image if present, otherwise falls back to og:title + description text.
--- Results are cached to avoid redundant HTTP requests.
---@param url string Remote page URL
local function preview_remote(url)
  if cache[url] then
    local cached = cache[url]
    if cached.image_url then
      show_remote_image(cached.image_url)
    else
      show_float(cached.lines)
    end
    return
  end

  local curl = require("plenary.curl")
  curl.get(url, {
    callback = function(response)
      vim.schedule(function()
        if response.status ~= 200 then
          show_float({ "Request failed: HTTP " .. response.status })
          return
        end

        -- local image_url = get_meta_content(response.body, 'property="og:image"')
        --
        -- if image_url then
        --   cache[url] = { image_url = image_url }
        --   show_remote_image(image_url)
        --   return
        -- end

        local title = get_meta_content(response.body, 'property="og:title"')
            or get_meta_content(response.body, 'name="title"')
        local desc = get_meta_content(response.body, 'name="description"')
            or get_meta_content(response.body, 'property="og:description"')

        local lines = {}
        if title then table.insert(lines, "# " .. title) end
        if desc then table.insert(lines, desc) end
        if #lines == 0 then table.insert(lines, "_No preview available_") end

        cache[url] = { lines = lines }
        show_float(lines)
      end)
    end,
  })
end

--- Previews a local file path.
--- Renders images with show_image; shows the first 30 lines of text files in a float.
---@param path string Absolute path to the local file
local function preview_local(path)
  if not vim.fn.filereadable(path) then
    show_float({ "_File not found: " .. path .. "_" })
    return
  end

  if is_image_path(path) then
    show_image(path)
    return
  end

  local lines = vim.fn.readfile(path, "", 30)
  if #lines == 0 then
    show_float({ "_Empty file_" })
    return
  end

  show_float(lines)
end

local function link_preview()
  local url, is_image = get_link_under_cursor()
  if not url or url:match("^#") then return end

  local is_remote = url:match("^https?://")

  if is_remote then
    if is_image then
      show_remote_image(url)
    else
      preview_remote(url)
    end
  else
    local dir = vim.fn.expand("%:p:h")
    local abs_path = vim.fn.resolve(dir .. "/" .. url)
    if is_image then
      show_image(abs_path)
    else
      preview_local(abs_path)
    end
  end
end

vim.keymap.set("n", "<C-S>", link_preview, {})

return {
  "3rd/image.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    backend = "kitty", -- or "ueberzugpp" if not on kitty/iterm2
  },
}
