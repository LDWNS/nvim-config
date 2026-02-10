return {
  'm-demare/attempt.nvim',
  keys = function()
    local attempt = require("attempt")

    return {
      { '<leader>ac', attempt.rename_buf,    mode = "n", desc = "attempt: rename" },
      { '<leader>ad', attempt.delete_buf,    mode = "n", desc = "attempt: delete" },
      { '<leader>ai', attempt.new_input_ext, mode = "n", desc = "attempt: new (input)" },
      { '<leader>al', attempt.open_select,   mode = "n", desc = "attempt: select" },
      { '<leader>an', attempt.new_select,    mode = "n", desc = "attempt: new (extension)" },
      { '<leader>ar', attempt.run,           mode = "n", desc = "attempt: run" },
    }
  end,
  config = function()
    require('attempt').setup {
      dir = vim.fn.expand('~') .. "/.local/share/attempt.nvim",
      initial_content = {
      },
      ext_options = { 'java', 'lua', 'js', 'go', 'sh', 'md', '' },
      format_opts = { [''] = '[None]' },
      run = {
        java = { 'w !java %' },
        go = { 'w !go run %' }
      }
    }
  end,
}
