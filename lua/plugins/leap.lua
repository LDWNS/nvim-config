return {
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")

      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      leap.opts.preview = false
    end,
  }
}
