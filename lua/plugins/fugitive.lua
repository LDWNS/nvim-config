return {
  "tpope/vim-fugitive",
  cmd = { "Git" },
  opt = {},
  keys = function()
    return {
      { "<leader>gs", vim.cmd.Git },
      { "<leader>gd", vim.cmd.Gdiff },
    }
  end,
}
