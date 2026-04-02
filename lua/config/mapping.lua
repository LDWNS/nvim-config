local set = require("vim.keymap").set
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore" })
set("n", "<leader>pv", ":Oil<cr>", { desc = "Explore" })

set("n", "<leader>ww", ":w<cr>", { desc = "Write" })
set("n", "<leader>wa", ":wa<cr>", { desc = "Write all" })

-- nice to haves
set({ "n", "v" }, "n", "nzzzv", { silent = true })
set({ "n", "v" }, "N", "Nzzzv", { silent = true })
set("n", "*", "*zzzv", { silent = true })
set("n", "#", "#zzzv", { silent = true })
set("n", " *", "*N", { silent = true })

-- go to next diagnostic
set("n", "]d", ":lua vim.diagnostic.jump({ count = 1, float = true })<CR>", { desc = "next diagnostic", silent = true })
--go to previous diagnostic
set("n", "[d", ":lua vim.diagnostic.jump({ count = -1, float = true })<CR>",
  { desc = "previous diagnostic", silent = true })

--escape term mode
set("t", "<Esc>", "<C-\\><C-n>")

--undotree
set("n", "<leader>u", ":Undotree<CR>", { desc = "Toggle undotree" })

-- LSP keybindings
local function get_opts(desc)
  --- @class vim.keymap.set.Opts
  local opts = { silent = true, nowait = true }
  opts.desc = desc
  return opts
end
set("n", "gd", vim.lsp.buf.definition, get_opts("gt definition"))
set("n", "gD", vim.lsp.buf.declaration, get_opts("gt declaration"))
set("n", "K", vim.lsp.buf.hover, get_opts())
set("n", "gi", vim.lsp.buf.implementation, get_opts("gt implementation"))
set("n", "<C-i>", vim.lsp.buf.signature_help, get_opts())
set("n", "<leader>rn", vim.lsp.buf.rename, get_opts("rename"))

--searching
set("n", "<CR>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode("<CR>")
  end
end, { expr = true })

-- custom
_G.context_fzf = function(opts)
  local fzf_lua = require 'fzf-lua'
  --- @module "fzf-lua"
  --- @class fzf-lua.config.Base
  opts = opts or {}
  opts.prompt = "Context> "
  opts.winopts = {
    height = 0.30,
    width = 0.40
  }
  opts.actions = {
    ['default'] = function(selected)
      if selected[1] == nil then
        return
      end
      -- open the file in the current buffer
      vim.cmd("e " .. selected[1])
    end,
    ['ctrl-v'] = function(selected)
      if selected[1] == nil then
        return
      end
      -- open the file in the vertical split
      vim.cmd("vsplit " .. selected[1])
    end
  }
  fzf_lua.fzf_exec(function(fzf_cb)
    local cwd = vim.fn.getcwd()
    -- check whether .context directory exists
    if vim.fn.isdirectory(cwd .. "/.context") == 0 then
      fzf_cb()
      return
    end
    local files = vim.fn.globpath(cwd .. "/.context/", "*", true, true)
    for _, value in pairs(files) do
      fzf_cb(fzf_lua.utils.ansi_escseq.white .. value .. fzf_lua.utils.ansi_escseq.clear)
    end
    fzf_cb()
  end, opts)
end

_G.oil_change = function(opts)
  local fzf_lua = require 'fzf-lua'
  --- @module "fzf-lua"
  --- @class fzf-lua.config.Base
  opts = opts or {}
  opts.prompt = "Gn> "
  opts.winopts = {
    height = 0.30,
    width = 0.40
  }
  opts.actions = {
    ['default'] = function(selected)
      if selected[1] == nil then
        return
      end
      local pth = string.gsub(selected[1], ".* ", "")
      vim.cmd("cd " .. pth)
      vim.opt.titlestring = GetTitle()
      local oil = require("oil")
      oil.open(pth)
    end
  }
  fzf_lua.fzf_exec(function(fzf_cb)
    for key, value in pairs(vim.g.shortpaths) do
      local short = fzf_lua.utils.ansi_escseq.white .. value .. fzf_lua.utils.ansi_escseq.clear
      local pth = fzf_lua.utils.ansi_escseq.grey .. key .. fzf_lua.utils.ansi_escseq.clear
      fzf_cb(short .. " " .. pth)
    end
    fzf_cb()
  end, opts)
end

vim.cmd([[command! -nargs=* Gn lua _G.oil_change()]])
set("n", "<leader>gn", _G.oil_change, get_opts("Go to shortpath (nvim)"))

vim.cmd([[command! -nargs=* Fk lua _G.context_fzf()]])
set("n", "<leader>fk", _G.context_fzf, get_opts("Open context file."))
