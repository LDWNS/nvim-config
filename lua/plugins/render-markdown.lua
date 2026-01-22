return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  enabled = function()
    -- Get the current working directory
    local cwd = vim.fn.getcwd()
    -- Disable if the path contains 'my-giant-repo'
    return not string.find(cwd, "V1")
  end,
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
      },
    })
  end,
}
