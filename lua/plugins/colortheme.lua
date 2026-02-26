return {
  {
    "daschw/leaf.nvim",
    dir = "~/Documents/personal/leaf.nvim/",
    name = "leaf",
    enabled = false,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({})
      vim.cmd("colorscheme tokyonight")
    end
  }
}
