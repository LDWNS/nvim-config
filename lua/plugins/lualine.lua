return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  lazy = false,
  priority = 1001,
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight"
      },
      sections = {
        lualine_a = {
          {
            'searchcount',
            maxcount = 9999,
            timeout = 500,
          }
        }
      }
    })
  end,
}
