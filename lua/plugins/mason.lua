return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
        "java-test"
      },
    },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}
