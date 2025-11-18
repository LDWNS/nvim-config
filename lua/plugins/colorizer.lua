-- gives color to colours, e.g. #4f5334
return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      css = { names = false, RRGGBBAA = true, css_fn = true },
      "lua",
      "javascript",
      "conf",
      html = { mode = "foreground" },
    },
  },
}
