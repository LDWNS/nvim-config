return {
    {
        "mfussenegger/nvim-jdtls",
        lazy =true,
        ft = "java",
        config = function()
            if vim.bo.filetype ~= "java" then
                return
            end
            local jdtls = require('jdtls')
            -- Find root of project
            local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
            local root_dir = require('jdtls.setup').find_root(root_markers)
            -- Eclipse workspace location
            local workspace_folder = "/Users/lukasdownes/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
            local lsp_install_location = "/Users/lukasdownes/.local/share/nvim/mason/packages/jdtls"
            local config = {
                -- Language server settings
                root_dir = root_dir,
                cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xmx1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens", "java.base/java.util=ALL-UNNAMED",
                    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                    "-jar", vim.fn.glob(lsp_install_location .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                    "-configuration", lsp_install_location .. "/config_mac",
                    "-data", workspace_folder
                },
                settings = {
                    java = {
                        format = {
                            settings = {
                                url = "/Users/lukasdownes/Documents/eclipse-format.xml",
                                profile = "Timefold", -- or your custom profile name
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
                        configuration = {
                            updateBuildConfiguration = "interactive",
                        },
                        maven = {
                            downloadSources = true,
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
                        contentProvider = { preferred = 'fernflower' },
                    },
                },
                -- Server capabilities
                capabilities = require('cmp_nvim_lsp').default_capabilities(),

                -- Key mappings
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, silent = true }

                    -- LSP keybindings
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)

                    -- Java specific keybindings
                    vim.keymap.set('n', '<leader>jo', "<cmd>lua require('jdtls').organize_imports()<CR>", opts)
                    vim.keymap.set('n', '<leader>jv', "<cmd>lua require('jdtls').extract_variable()<CR>", opts)
                    vim.keymap.set('v', '<leader>jv', "<cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
                    vim.keymap.set('n', '<leader>jc', "<cmd>lua require('jdtls').extract_constant()<CR>", opts)
                    vim.keymap.set('v', '<leader>jc', "<cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
                    vim.keymap.set('v', '<leader>jm', "<cmd>lua require('jdtls').extract_method(true)<CR>", opts)
                    vim.keymap.set('n', '<leader>jt', "<cmd>lua require('jdtls').test_class()<CR>", opts)
                    vim.keymap.set('n', '<leader>jn', "<cmd>lua require('jdtls').test_nearest_method()<CR>", opts)
                end,
            }
            -- Start or attach to language server
            jdtls.start_or_attach(config)
        end,

        -- Optional: Add dependencies
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    {
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-jdtls",
            "mfussenegger/nvim-dap", -- for the debugger
            "rcarriga/nvim-dap-ui", -- recommended
            "theHamsta/nvim-dap-virtual-text", -- recommended
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-java")({
                    }),
                },
            })
            vim.keymap.set("n", "<leader>jt", "<cmd>lua require('neotest').run.run()<cr>")

        end,
    }
}
