-- ~/nvim/lua/slydragonn/plugins/lspconfig.lua

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = {
      "lemminx", "nvim_lsp", "lua_ls",
      "bashls", "cssls", "tailwindcss",
      "tailwindcss", "html", "ts_ls",
      "jsonls", "eslint", "yamlls",
      "marksman"
    };

    for _, server in ipairs(servers) do
      vim.lsp.config[server] = {
        capabilities = capabilities,
      }
      vim.lsp.enable(server)
    end
  end,
}
