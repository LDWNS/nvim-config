local function enableJDTLS()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- Eclipse workspace location
  local plugin_install_location = "/Users/lukasdownes/.local/share/nvim/mason/packages"
  local bundles = {
    vim.fn.glob(
      plugin_install_location .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
      true)
  }

  vim.list_extend(bundles,
    vim.split(vim.fn.glob(plugin_install_location .. "/java-test/extension/server/*.jar", true), "\n"))

  -- Start or attach to language server
  vim.lsp.config("jdtls", {
    capabilities = capabilities,
    settings = {
      java = {
        test = {
          defaultConfig = "quarkus",
        },
        format = {
          settings = {
            url = "/Users/lukasdownes/Documents/eclipse-format.xml",
            profile = "Quarkus",
          },
        },
        completion = {
          importOrder = {
            "java",
            "jakarta",
            "javax",
            "ai.timefold",
            "org",
            "com",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 999,
            staticStarThreshold = 999,
          },
        },
        eclipse = {
          downloadSources = true,
        },
        maven = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        init_options = bundles,
      },
    },
  })

  vim.lsp.enable("jdtls")
end

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
      "marksman"
    };

    for _, server in ipairs(servers) do
      vim.lsp.config[server] = {
        capabilities = capabilities,
      }
      vim.lsp.enable(server)
    end

    -- enableJDTLS()
  end,
}
