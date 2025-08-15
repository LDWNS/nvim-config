return {
    "tpope/vim-fugitive",
    ---@module "fugitive"
    ---@type fugitive.setupOpts
    opt ={},
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff)
    end
}
