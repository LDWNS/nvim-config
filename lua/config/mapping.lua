local set = require("vim.keymap").set
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore" })
set("n", "<leader>pv", ":Oil<cr>", { desc = "Explore" })

-- nice to haves
set({ "n", "v" }, "n", "nzzzv", { silent = true })
set({ "n", "v" }, "N", "Nzzzv", { silent = true })
set("n", "*", "*zzzv", { silent = true })
set("n", "#", "#zzzv", { silent = true })

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
local function get_opts(desc)
  --- @type vim.keymap.set.Opts
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
-- replaced with fzf
-- set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

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
