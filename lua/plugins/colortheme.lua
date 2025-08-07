return {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("github-theme").setup({})
        require("lualine").setup({})

        vim.api.nvim_create_autocmd("VimEnter",{
            callback = function()
                -- log the os
                local os = vim.uv.os_uname().sysname
                local theme = "Dark"
                if (os == "Darwin") then
                    -- execute command to get the theme
                    local fh, er = assert(io.popen("defaults read -g AppleInterfaceStyle","r"))
                    local temp = fh:read("*a")
                    fh:close()
                    if (temp == nil or temp == "") then
                        theme = "Light"
                    end
                end

                vim.notify(
                    "[" .. os .. "] theme: " .. theme,
                    vim.log.levels.INFO,
                    { title = "Me!" }
                )

                if (theme == "Dark") then
                    -- vim.cmd("colorscheme github_dark_colorblind")
                    -- vim.cmd("colorscheme github_dark")
                    -- vim.cmd("colorscheme github_dark_tritanopia")
                    vim.cmd("colorscheme github_dark_default")

                else
                    vim.cmd("colorscheme github_light")
                end

                require("lualine").setup({})
            end
        })
	end,
}
