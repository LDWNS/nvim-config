return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>ha", function() harpoon:list():add() end,                         desc = "harpoon: add" },
      { "<leader>hh",  function() harpoon:list():select(1) end,                     desc = "harpoon: 1" },
      { "<leader>hj",  function() harpoon:list():select(2) end,                     desc = "harpoon: 2" },
      { "<leader>hk",  function() harpoon:list():select(3) end,                     desc = "harpoon: 3" },
      { "<leader>hl",  function() harpoon:list():select(4) end,                     desc = "harpoon: 4" },
      { "<C-;>",      function() harpoon:list():select(5) end,                     desc = "harpoon: 5" },
      { "<C-h>",      function() harpoon:list():select(1) end,                     desc = "harpoon: 1" },
      { "<C-j>",      function() harpoon:list():select(2) end,                     desc = "harpoon: 2" },
      { "<C-k>",      function() harpoon:list():select(3) end,                     desc = "harpoon: 3" },
      { "<C-l>",      function() harpoon:list():select(4) end,                     desc = "harpoon: 4" },
      { "<C-;>",      function() harpoon:list():select(5) end,                     desc = "harpoon: 5" },
      { "<leader>hn", function() harpoon:list():next({ ui_nav_wrap = true }) end,  desc = "harpoon: next" },
      { "<leader>hp", function() harpoon:list():prev({ ui_nav_wrap = true }) end,  desc = "harpoon: prev" },
      { "<C-e>",      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon: ui" },
    }
  end,
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})
  end,
}
