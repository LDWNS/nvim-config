return {
    "mfussenegger/nvim-jdtls",
    lazy =true,
    ft = "java",
    config = function()
        local jdtls = require('jdtls')
        -- Find root of project
        local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
        local root_dir = require('jdtls.setup').find_root(root_markers)
        -- Eclipse workspace location
        local workspace_folder = "/path/to/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
        local config = {
            -- Language server settings
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

        }
        -- Start or attach to language server
        jdtls.start_or_attach(config)
    end,

    -- Optional: Add dependencies
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
}
