return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require('render-markdown').setup({
      code = {
        border = "thick"
      },
      heading = {
        icons = { '󰫎 ', '2󰫎 ', '3󰫎 ', '4󰫎 ', '5󰫎 ', '6󰫎 ' },
        position = 'inline',
        -- Width of the heading background.
        width = 'block',
      },
    })
  end,
}
