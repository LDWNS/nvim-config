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
      "css",
      "javascript",
      conf = {
        mode = "foreground",
        css_fn = true,
      },
      hyprlang = {
        mode = "foreground",
        css_fn = true,
      }, 
      html = { mode = "foreground" },
    },
  },
}
