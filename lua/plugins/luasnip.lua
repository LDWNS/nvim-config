return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",
    build = "make install_jsregexp",
    config = function(_, _)
        require("luasnip").setup({})
        require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })
    end
}
