return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local servers = {
      "lemminx", "lua_ls",
      "bashls", "cssls", "tailwindcss",
      "html", "vtsls",
      "jsonls", "eslint", "yamlls",
      "marksman", "gopls", "pyright"
    };

    local capabilities = require("blink-cmp").get_lsp_capabilities()
    vim.lsp.config('*', { capabilities = capabilities })
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
