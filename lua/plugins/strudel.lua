return {
  "gruvw/strudel.nvim",
  enabled = false,
  build = "npm ci",
  config = function()
    require("strudel").setup()
  end,
}
