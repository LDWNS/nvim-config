return {
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
    keys = function(client, bufnr)
      --- @type vim.keymap.set.Opts
      local opts = { buffer = bufnr, silent = true }
      return {
        -- general sdk
        { '<leader>jo', "<cmd>lua require('jdtls').organize_imports()<CR>",     desc = "java: organize imports", opts },
        { '<leader>jv', "<cmd>lua require('jdtls').extract_variable()<CR>",     desc = "java: extract variable", opts },
        { '<leader>jv', "<cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "java: extract variable", opts, mode = 'v' },
        { '<leader>jc', "<cmd>lua require('jdtls').extract_constant()<CR>",     desc = "java: extract const",    opts },
        { '<leader>jc', "<cmd>lua require('jdtls').extract_constant(true)<CR>", desc = "java: extract const",    opts, mode = 'v' },
        { '<leader>jm', "<cmd>lua require('jdtls').extract_method(true)<CR>",   desc = "java: extract method",   opts, mode = 'v' },
        { '<leader>jt', "<cmd>lua require('jdtls').test_class()<CR>",           desc = "java: run test class",   opts },
        { '<leader>jn', "<cmd>lua require('jdtls').test_nearest_method()<CR>",  desc = "java: run nearest test", opts },
      }
    end,
    -- Optional: Add dependencies
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        keys = {
          { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "DAP toggle breakpoint" },
          { "<leader>dc", "<cmd>DapContinue<CR>",         desc = "DAP Continue" },
          { "<leader>dv", "<cmd>DapViewToggle<CR>",       desc = "DAP View Toggle" },
          { "<leader>de", "<cmd>DapEval<CR>",             desc = "DAP Eval" }
        },
        dependencies = {
          "theHamsta/nvim-dap-virtual-text",
          "igorlfs/nvim-dap-view"
        },
        config = function()
          require("nvim-dap-virtual-text").setup({})
        end
      },
      "rcarriga/nvim-dap-ui",
    },
  }
}
