return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>a", function() harpoon:list():add() end,                         desc = "harpoon: add" },
      { "<C-h>",     function() harpoon:list():select(1) end,                     desc = "harpoon: 1" },
      { "<C-j>",     function() harpoon:list():select(2) end,                     desc = "harpoon: 2" },
      { "<C-k>",     function() harpoon:list():select(3) end,                     desc = "harpoon: 3" },
      { "<C-l>",     function() harpoon:list():select(4) end,                     desc = "harpoon: 4" },
      { "<C-;>",     function() harpoon:list():select(5) end,                     desc = "harpoon: 5" },
      { "<C-e>",     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon: ui" },
    }
  end,
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})
  end,
}
