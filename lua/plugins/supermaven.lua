return {
    {
        "supermaven-inc/supermaven-nvim",
        ft = { "java", "lua", "js", "ts" },
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-S-L>",
                    clear_suggestion = "<C-S-H>",
                    accept_word = "<C-S-K>",
                },
                ignore_filetypes = { "markdown" },
            })
        end,
    },
}
