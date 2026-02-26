local detail = false
return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@class oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true
    },
    float = {
      max_width = .6,
      max_height = .6,
    },
    keymaps = {
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  },
  keys = {
    { "<leader>of", "<cmd>lua require('oil').open_float()<CR>" }
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },}
