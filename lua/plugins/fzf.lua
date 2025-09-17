return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/snacks.nvim",
      'MeanderingProgrammer/render-markdown.nvim',
    },
    keys = function()
      local fzf = require("fzf-lua")
      return {
        { '<leader>ff', fzf.files },
        { '<leader>fg', fzf.live_grep },
        { '<leader>fb', fzf.buffers },
        { '<leader>fh', fzf.help_tags },
        { '<leader>fs', fzf.git_status },
        { '<leader>fc', fzf.git_commits },
        { '<leader>fi', fzf.git_files },
        { '<leader>gr', fzf.lsp_references },
      }
    end,
    config = function()
      require("fzf-lua").setup({
        previewers = {
          builtin = {
            snacks_image = { enabled = true, render_inline = false },
            render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
            extensions = {
              ["png"] = { "viu", "-b" },
              ["svg"] = { "chafa", "{file}" },
              ["jpg"] = { "ueberzug" },
            }
          }
        }
      })
    end,
    opts = {}
  }
}
