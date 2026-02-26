---@diagnostic disable: undefined-global
return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    ft = { "java", "typescript", "javascript" },
    config = true,
    lazy = true,
    event = "VeryLazy",
    keys = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local quarkus_dev = Terminal:new({
        cmd = "mvn quarkus:dev",
        hidden = true,
        direction = "horizontal",
        close_on_exit = true,
      })

      local function _quarkus_dev_toggle()
        quarkus_dev:toggle()
      end

      return {
        { "<leader>ja", _quarkus_dev_toggle, desc = "java: run all", silent = true }
      }
    end
  }
}
