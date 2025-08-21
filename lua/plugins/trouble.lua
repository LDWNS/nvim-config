
return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=true win.position=left<cr>",
            desc = "Symbols (Trouble)",
        },
       {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=true win.position=left<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    }
}
