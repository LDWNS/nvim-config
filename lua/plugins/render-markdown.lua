return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', "nvim-mini/mini.icons" },
  opts = {},
  lazy = true,
  ft = "markdown",
  enabled = false,
  config = function()
    require('render-markdown').setup({
      code = {
        border = "thick"
      },
      latex = {
        enabled = false
      },
      heading = {
        icons = { '󰫎 ', '2󰫎 ', '3󰫎 ', '4󰫎 ', '5󰫎 ', '6󰫎 ' },
        position = 'inline',
        -- Width of the heading background.
        width = 'block',
      }
    })
  end,
}
