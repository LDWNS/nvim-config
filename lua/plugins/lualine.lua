return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  lazy = false,
  priority = 1001,
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight"
      },
      sections = {
        lualine_a = {
          {
            'searchcount',
            maxcount = 9999,
            timeout = 500,
          },
        },
        lualine_c = {
          {
            'filename'
          },
          {
            'lsp_status',
            icon = '', -- f013
            symbols = {
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              done = '✓',
              separator = ' ',
            },
            ignore_lsp = {},
            show_name = true,
          },
        },
        lualine_x = { {
          'macro',
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Recording @" .. reg
            end
            return nil
          end,
          color = { fg = "#ff9e64" },
          draw_empty = false,
        },
        }
      }
    })
  end,
}
