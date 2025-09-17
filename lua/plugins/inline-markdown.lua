return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require('render-markdown').setup({
      heading = {
        -- Turn on / off heading icon & background rendering.
        enabled = true,
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
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#333333', fg = '#EE6352' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#333333', fg = '#59CD90' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#333333', fg = '#3FA7D6' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#333333', fg = '#F8A20E' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#333333', fg = '#F57E5E' })
  end,
}
