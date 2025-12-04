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
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  }
}
