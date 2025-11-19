return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
        local harpoon = require("harpoon")
        return {
            { "<leader>a", function() harpoon:list():add() end },
            { "<C-h>", function() harpoon:list():select(1) end },
            { "<C-j>", function() harpoon:list():select(2) end },
            { "<C-k>", function() harpoon:list():select(3) end },
            { "<C-l>", function() harpoon:list():select(4) end },
            { "<C-;>", function() harpoon:list():select(5) end },
            { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
        }
    end,
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})
    end,
}
