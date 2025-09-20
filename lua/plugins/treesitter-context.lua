return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufNewFile", "BufReadPre" },
  config = function()
    require("treesitter-context").setup({})
  end,
}
