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
                }
            })

            require("mason-lspconfig").setup({
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
                    "marksman",
                    "lemminx",
                },
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "prettier",
                    "eslint_d",
                    "java-debug-adapter",
                    "java-test",
                },
            })
        end,
    },
}
