return {
    "tpope/vim-fugitive",
    opt ={},
    keys = {
        {"<leader>gs", vim.cmd.Git},
        {"<leader>gd", vim.cmd.Gdiff}
    },
}
