return {
  'saghen/blink.cmp',
  dependencies = { 'L3MON4D3/LuaSnip' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@class blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    keymap = {
      preset = 'default',
      ['<C-y>'] = {},
      ['<CR>'] = {
        function(cmp)
          if vim.v.hlsearch == 1 then
            vim.cmd.nohl()
            return true
          end
        end, "select_and_accept", "fallback" },
      ['<Tab>'] = { "snippet_forward", "fallback" },
      ['<S-Tab>'] = { "snippet_backward", "fallback" }
    },

    snippets = { preset = 'luasnip' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
