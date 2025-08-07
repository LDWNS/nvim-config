return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:mkindberg/ghostty-ls"
                }
            })

            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "cssls",
                    "eslint",
                    "html",
                    "ts_ls",
                    "lua_ls",
                    "bashls",
                    "jsonls",
                    "tailwindcss",
                    "jdtls",
                },
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "prettier",
                    "stylua",
                    "eslint_d",
                    "java-debug-adapter",
                    "java-test",
                },
            })
        end,
    },
    {"mkindberg/ghostty-ls", config = true},
}
