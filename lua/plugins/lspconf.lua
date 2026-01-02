return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = {
      "lemminx", "lua_ls",
      "bashls", "cssls", "tailwindcss",
      "tailwindcss", "html", "ts_ls",
      "jsonls", "eslint", "yamlls",
      "marksman", "gh-actions-language-server"
    };

    for _, server in ipairs(servers) do
      vim.lsp.config[server] = {
        capabilities = capabilities,
      }
      vim.lsp.enable(server)
    end

  end,
}
