-- gives color to colours, e.g. #4f5334
return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        filetypes = {
            "css",
            "lua",
            "javascript",
            "conf",
            html = { mode = "foreground" },
        },
    },
}
