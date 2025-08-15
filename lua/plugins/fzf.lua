return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    keys = {
        { '<leader>ff', '<cmd>:lua require("fzf-lua").files()<cr>' },
        { '<leader>fg', '<cmd>:lua require("fzf-lua").live_grep()<cr>' },
        { '<leader>fb', '<cmd>:lua require("fzf-lua").buffers()<cr>' },
        { '<leader>fh', '<cmd>:lua require("fzf-lua").help_tags()<cr>' },
        { '<leader>fs', '<cmd>:lua require("fzf-lua").git_status()<cr>' },
        { '<leader>fc', '<cmd>:lua require("fzf-lua").git_commits()<cr>' },
        { '<leader>fi', '<cmd>:lua require("fzf-lua").git_files()<cr>' },
    },
    config = function()
        require("fzf-lua").setup()
    end,
    opts = {}
}
