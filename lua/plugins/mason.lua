return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- lsps
        "cssls",
        "eslint",
        "html",
        "ts_ls",
        "lua_ls",
        "bashls",
        "jsonls",
        "tailwindcss",
        "jdtls",
        "marksman",
        "lemminx",
        "gopls",
        -- tools
        "prettierd",
        "eslint_d",
        "java-debug-adapter",
        "js-debug-adapter",
        "java-test"
      },
      run_on_start = false
    },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}
