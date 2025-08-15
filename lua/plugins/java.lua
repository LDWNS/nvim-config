return {
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = "java",
        keys = function(client, bufnr)
            --- @type vim.keymap.set.Opts
            local opts = { buffer = bufnr, silent = true }
            return {
                -- general sdk
                { '<leader>jo', "<cmd>lua require('jdtls').organize_imports()<CR>",     opts },
                { '<leader>jv', "<cmd>lua require('jdtls').extract_variable()<CR>",     opts },
                { '<leader>jv', "<cmd>lua require('jdtls').extract_variable(true)<CR>", opts, mode = 'v' },
                { '<leader>jc', "<cmd>lua require('jdtls').extract_constant()<CR>",     opts },
                { '<leader>jc', "<cmd>lua require('jdtls').extract_constant(true)<CR>", opts, mode = 'v' },
                { '<leader>jm', "<cmd>lua require('jdtls').extract_method(true)<CR>",   opts, mode = 'v' },
                { '<leader>jt', "<cmd>lua require('jdtls').test_class()<CR>",           opts },
                { '<leader>jn', "<cmd>lua require('jdtls').test_nearest_method()<CR>",  opts },
            }
        end,
        config = function()
            -- if vim.bo.filetype ~= "java" then
            --     return
            -- end
            local jdtls = require('jdtls')
            -- Find root of project
            local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
            local root_dir = require("jdtls.setup").find_root(root_markers)
            -- Eclipse workspace location
            local workspace_folder = "/Users/lukasdownes/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
            local plugin_install_location = "/Users/lukasdownes/.local/share/nvim/mason/packages/"
            local bundles = {
                vim.fn.glob(
                plugin_install_location .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
                    true)
            }

            vim.list_extend(bundles,
                vim.split(vim.fn.glob(plugin_install_location .. "/java-test/extension/server/*.jar", true), "\n"))

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
                    "-jar", vim.fn.glob(plugin_install_location .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
                    "-configuration", plugin_install_location .. "/jdtls/config_mac",
                    "-data", workspace_folder
                },
                settings = {
                    java = {
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
                    },
                },
                -- Server capabilities
                capabilities = require("cmp_nvim_lsp").default_capabilities(),

                -- Key mappings
                on_attach = function()
                    require("jdtls").setup_dap({ hotcodereplace = "auto" })
                    require("jdtls.dap").setup_dap_main_class_configs()
                end,

                -- debugging
                init_options = {
                    bundles = bundles,
                },

            }
            -- Start or attach to language server
            jdtls.start_or_attach(config)
        end,

        -- Optional: Add dependencies
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
    }
}
