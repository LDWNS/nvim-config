vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.g.disable_autoformat = true

-- folds
-- vim.opt.foldmethod = "indent"

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
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.diagnostic.config({
  virtual_text = true,      -- show inline messages
  signs = true,             -- show signs in the gutter
  underline = true,         -- underline problematic text
  update_in_insert = false, -- don't update diagnostics while typing
  severity_sort = true,     -- sort diagnostics by severity
})

-- colours
vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

-- noice ~/../. works with 'gf' command (goto file)
vim.opt.isfname:append("@-@")

-- nice border around windows
vim.opt.winborder = "rounded"

-- Experimental UI2: floating cmdline and messages
vim.o.cmdheight = 0
require('vim._core.ui2').enable()

-- custom aliases
vim.api.nvim_create_user_command("Gpr", "Git pull --rebase origin main", {})
vim.api.nvim_create_user_command("Gs", "Git status -sb", {})
vim.api.nvim_create_user_command("Gpf", "Git push --force", {})

local shortpaths = require("config.shortpaths")
vim.g.shortpaths = shortpaths
-- set title
vim.opt.title = true
vim.opt.titlestring = GetTitle()
