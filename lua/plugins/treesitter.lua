return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  branch = "main",
  build = ":TSUpdate",
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
    local ensureInstalled = {
      'lua', 'python', 'typescript',
      'json', 'javascript', 'html',
      'css', 'markdown', 'markdown_inline',
      'bash', 'vim', 'java', 'go'
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
}
