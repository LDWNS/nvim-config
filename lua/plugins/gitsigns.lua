return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "<leader>gl",
      function()
        require("gitsigns").toggle_signs()
      end,
      desc = "Load Gitsigns and toggle signs",
    },
  },
  config = function()
    require("gitsigns").setup({
      signcolumn = false
    })
  end,
}
