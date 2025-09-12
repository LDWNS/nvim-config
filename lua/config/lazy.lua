-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- set colorscheme depending on OS
local os = vim.uv.os_uname().sysname
local theme = "github_dark_tritanopia"
if (os == "Darwin") then
  -- execute command to get the theme
  local fh, er = assert(io.popen("defaults read -g AppleInterfaceStyle", "r"))
  local temp = fh:read("*a")
  fh:close()
  if (temp == nil or temp == "") then
    theme = "github_light"
  elseif (temp == "Dark") then
    theme = "github_dark_tritanopia"
  end
  vim.notify(
    "[" .. os .. "] theme: " .. theme,
    vim.log.levels.INFO,
    { title = "Me!" }
  )
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { theme } },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    frequency = 3600 * 24 * 7, 
  },
})
