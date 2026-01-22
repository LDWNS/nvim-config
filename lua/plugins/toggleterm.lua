return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local quarkus_test = Terminal:new({
        cmd = "mvn quarkus:dev",
        hidden = true,
        direction = "horizontal",
        close_on_exit = true,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_chan_send(term.job_id, "r")
        end,
      })

      local function _quarkus_test_toggle()
        quarkus_test:toggle()
      end

      return {
        { "<leader>ja", _quarkus_test_toggle, desc = "java: run all", silent = true }
      }
    end
  }
}
