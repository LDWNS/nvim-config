return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({})
    require("lualine").setup({})

    local os = vim.uv.os_uname().sysname
    local theme = "github_dark_tritanopia"
    if (os == "Darwin") then
      -- execute command to get the theme
      local fh, er = assert(io.popen("defaults read -g AppleInterfaceStyle", "r"))
      local temp = fh:read("*a")
      fh:close()
      if (temp == nil or temp == "") then
        theme = "github_light"
      elseif (temp == "Dark") then
        theme = "github_dark_tritanopia"
      end
      vim.cmd("colorscheme " .. theme)
    end
  end,
}
