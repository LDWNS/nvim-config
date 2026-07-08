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

-- colours
vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

-- noice ~/../. works with 'gf' command (goto file)
vim.opt.isfname:append("@-@")

-- nice border around windows
vim.opt.winborder = "rounded"

-- Experimental UI2: floating cmdline and messages
o.cmdheight = 0
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'msg',
      empty = 'cmd',
      bufwrite = 'msg',
      confirm = 'cmd',
      emsg = 'pager',
      echo = 'msg',
      echomsg = 'msg',
      echoerr = 'pager',
      completion = 'cmd',
      list_cmd = 'pager',
      lua_error = 'pager',
      lua_print = 'msg',
      progress = 'pager',
      rpc_error = 'pager',
      quickfix = 'msg',
      search_cmd = 'cmd',
      search_count = 'cmd',
      shell_cmd = 'pager',
      shell_err = 'pager',
      shell_out = 'pager',
      shell_ret = 'msg',
      undo = 'msg',
      verbose = 'pager',
      wildlist = 'cmd',
      wmsg = 'msg',
      typed_cmd = 'cmd',
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})

-- custom aliases
vim.api.nvim_create_user_command("Gpr", "Git pull --rebase origin main", {})
vim.api.nvim_create_user_command("Gs", "Git status -sb", {})
vim.api.nvim_create_user_command("Gpf", "Git push --force", {})

local shortpaths = require("config.shortpaths")
vim.g.shortpaths = shortpaths
-- set title
vim.opt.title = true
vim.opt.titlestring = GetTitle()
