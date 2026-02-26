return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "DAP toggle breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<CR>", desc = "DAP Continue" },
      { "<leader>dv", "<cmd>DapViewToggle<CR>", desc = "DAP View Toggle" },
      { "<leader>de", "<cmd>DapEval<CR>", desc = "DAP Eval" }
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
