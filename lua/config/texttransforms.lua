local M = {}

-- Source - https://stackoverflow.com/a/78607540
-- Posted by Telemachus, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-04-03, License - CC BY-SA 4.0
local _should_swap = function(s_pos, e_pos)
  -- 1. If s_pos is on a line below e_pos, they are reversed.
  if s_pos[2] > e_pos[2] then
    return true
  end
  -- 2. If s_pos and e_pos are on the same line, and s_pos
  --    is in a later column, they are reversed.
  if s_pos[2] == e_pos[2] and s_pos[3] > e_pos[3] then
    return true
  end
  -- 3. If s_pos is on an earlier line than e_pos or the same line
  --    but an earlier column, they are not reversed.
  return false
end

--- @param method function
--- @return nil
M.replaceText = function(method)
  local s_pos = vim.fn.getpos("v")
  local e_pos = vim.fn.getpos(".")

  if _should_swap(s_pos, e_pos) then
    s_pos, e_pos = e_pos, s_pos
  end

  local buf_text = vim.api.nvim_buf_get_text(
    s_pos[1],
    s_pos[2] - 1,
    s_pos[3] - 1,
    e_pos[2] - 1,
    e_pos[3], {}
  )
  local new_text = method(buf_text[1])
  vim.api.nvim_buf_set_text(
    s_pos[1],
    s_pos[2] - 1,
    s_pos[3] - 1,
    e_pos[2] - 1,
    e_pos[3],
    { new_text }
  )
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
    "nx",
    false
  )
end

---@param text string   -- e.g. SELECTED_TEXT
---@return string       -- e.g. SelectedText
M.SnakeToPascal = function(text)
  local list = {}
  text = text:upper()
  -- split the text by underscores and capitalize the first letter of each word
  for word in string.gmatch(text, "[^_]+") do
    table.insert(list, word:sub(1, 1) .. word:sub(2):lower())
  end
  return table.concat(list);
end

---@param text string   -- e.g. SELECTED_TEXT
---@return string       -- e.g. selectedText
M.SnakeToCamel = function(text)
  local index = 0
  local list = {}
  text = text:upper()
  for word in string.gmatch(text, "[^_]+") do
    if index == 0 then
      table.insert(list, word:lower())
    else
      table.insert(list, word:sub(1, 1) .. word:sub(2):lower())
    end
    index = index + 1
  end
  return table.concat(list)
end

---@param text string
---@return string
M.PasCamelToSnakeCase = function(text)
  if string.match(text, "^[A-Z]") ~= nil then
    return text:gsub("[A-Z]", "_%0"):sub(2):lower();
  end
  return text:gsub("[A-Z]", "_%0"):lower();
end

---@param text string
---@return string
M.PasCamelToCSnakeCase = function(text)
  if string.match(text, "^[A-Z]") ~= nil then
    return text:gsub("[A-Z]", "_%0"):sub(2):upper();
  end
  return text:gsub("[A-Z]", "_%0"):upper();
end


return M
