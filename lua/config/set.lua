--vim.g.autoformat = failsafe

--maybe not needed
--vim.opt.formatoptions = "t"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- backups
vim.opt.swapfile = false
vim.opt.backup = false

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- colours
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

-- noice ~ works with 'gf' command (goto file)
vim.opt.isfname:append("@-@")

-- nice border around windows
vim.opt.winborder = "rounded"

-- set title
vim.opt.title = true

local shortpaths = require("config.shortpaths")
local getTitle = function()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local cwdSubbed = cwd:gsub("-", "")
  local shortpath = shortpaths[cwdSubbed]
  if shortpath then
    return shortpath
  end
  return "⌘ " .. cwd
end

vim.opt.titlestring = "[" .. getTitle() .. "]"
