return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", "DAP toggle breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<CR>", "DAP Continue" },
      { "<leader>dv", "<cmd>DapViewToggle<CR>", "DAP View Toggle" }
    },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "igorlfs/nvim-dap-view"
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
}
