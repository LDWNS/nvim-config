-- ~/nvim/lua/slydragonn/plugins/telescope.lua

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({})

        -- set keymaps
        local keymap = vim.keymap
        local builtin = require('telescope.builtin')
        keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Telescope git status' })
        keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope git commits' })
    end,
}

