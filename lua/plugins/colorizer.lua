return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { 
        filetypes = {
            "css",
            "javascript",
            html = { mode = "foreground" },
        },
    },
}
