return {
  "tpope/vim-fugitive",
  cmd = { "Git" },
  opt = {},
  keys = function()
    return {
      { "<leader>gs", vim.cmd.Git,   desc = "Git status" },
      { "<leader>gd", vim.cmd.Gdiff, desc = "Git diff" },
    }
  end,
}
