-- ~/nvim/lua/slydragonn/plugins/lspconfig.lua

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local nvim_lsp = require("lspconfig")

    local on_attach = function(client, bufnr)
      -- Show line diagnostics automatically in hover window
      vim.o.updatetime = 250
      vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    mason_lspconfig.setup({
      automatic_enable = {
        exclude = {
          "jdtls"
        }
      },
      handlers = {
        ["nvim_lsp"] = function(server)
          nvim_lsp[server].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          nvim_lsp["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["bashls"] = function()
          nvim_lsp["bashls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["cssls"] = function()
          nvim_lsp["cssls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["tailwindcss"] = function()
          nvim_lsp["tailwindcss"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["html"] = function()
          nvim_lsp["html"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["ts_ls"] = function()
          nvim_lsp["ts_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["jsonls"] = function()
          nvim_lsp["jsonls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["eslint"] = function()
          nvim_lsp["eslint"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["yaml-language-server"] = function()
          nvim_lsp["yamlls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["marksman"] = function()
          nvim_lsp["marksman"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,

        function(server_name)
          if server_name == "jdtls" then
            return
          end
          require('lspconfig')[server_name].setup({})
        end,
      },
    })
  end,
}
