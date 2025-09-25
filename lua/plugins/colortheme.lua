return {
  -- "projekt0n/github-nvim-theme",
  "daschw/leaf.nvim",
  -- name = "github-theme",
  name = "leaf",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- require("github-theme").setup({})
    --
    require("leaf").setup({
    })
    require("lualine").setup({})
    vim.cmd("colorscheme leaf")

    -- leaf_light_0 = "#FFFFFB", -- (258, 261, 251)
    -- leaf_light_1 = "#F1F5EC", -- (241, 245, 236)
    -- leaf_light_2 = "#E1E4DC", -- (225, 228, 220)
    -- leaf_light_3 = "#D1D3CC", -- (209, 211, 204)
    -- dark
    -- leaf_dark_0 = "#0D0B10", -- (13, 11, 16)
    -- leaf_dark_1 = "#1E1B1F", -- (30, 27, 31)
    -- leaf_dark_2 = "#2E2C2F", -- (46, 44, 47)
    -- leaf_dark_3 = "#3E3D3F", -- (62, 61, 63)

    
  end
}
