return {
  -- "projekt0n/github-nvim-theme",
  -- "daschw/leaf.nvim",
  dir = "~/Documents/personal/leaf.nvim/",
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
  end
}
