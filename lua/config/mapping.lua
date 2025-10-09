local set = require("vim.keymap").set
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
set("n", "<leader>pv", vim.cmd.Ex)

-- nice to haves
set("n", "n", "nzzzv", {silent = true})
set("n", "N", "Nzzzv", {silent = true})
set("n", "*", "*zzzv", {silent = true})
set("n", "#", "#zzzv", {silent = true})

-- go to next diagnostic
set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end
)

--go to previous diagnostic
set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end
)

--escape term mode
set("t", "<Esc>", "<C-\\><C-n>")

-- LSP keybindings
--- @type vim.keymap.set.Opts
local opts = { silent = true, nowait = true }
set("n", "gD", vim.lsp.buf.declaration, opts)
set("n", "gd", vim.lsp.buf.definition, opts)
set("n", "K", vim.lsp.buf.hover, opts)
set("n", "gi", vim.lsp.buf.implementation, opts)
set("n", "<C-i>", vim.lsp.buf.signature_help, opts)
set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- replaced with fzf
-- set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
set("n", "<leader>fo", vim.lsp.buf.format, opts)



--searching
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode("<CR>")
  end
end, { expr = true })

