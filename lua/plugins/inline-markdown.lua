return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require('render-markdown').setup({
      code = {
        border = "thin",
        disable_background = true,
      },
      heading = {
        -- Turn on / off heading icon & background rendering.
        enabled = false,
        atx = true,
        setext = true,
        sign = true,
        icons = { '󰫎 ' },
        left_pad = 0,
        right_pad = 1,
        left_margin = 0,
        position = 'overlay',
        -- Added to the sign column if enabled.
        signs = {},
        -- Width of the heading background.
        width = 'block',
      },
    })
  end,
}
