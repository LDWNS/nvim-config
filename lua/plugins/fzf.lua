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
        { '<leader>ff', fzf.files,            desc = "Fzf: files" },
        { '<leader>fg', fzf.live_grep,        desc = "Fzf: grep" },
        { '<leader>fb', fzf.buffers,          desc = "Fzf: buffers" },
        { '<leader>fh', fzf.help_tags,        desc = "Fzf: vim help" },
        { '<leader>fs', fzf.git_status,       desc = "Fzf: status" },
        { '<leader>fc', fzf.git_commits,      desc = "Fzf: commits" },
        { '<leader>fi', fzf.git_files,        desc = "Fzf: git files" },
        { '<leader>gr', fzf.lsp_references,   desc = "Fzf: lsp refs" },
        { '<leader>ca', fzf.lsp_code_actions, desc = "Fzf: lsp code actions", silent = true, mode = { "n", "v" } },
        { '<leader>fb', fzf.manpages,         desc = "Fzf: man" },
      }
    end,
    config = function()
      require("fzf-lua").setup({
        grep = {
          hidden = true,
        },
        previewers = {
          builtin = {
            snacks_image = { enabled = true, render_inline = false },
            render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
            extensions = {
              ["png"] = { "viu", "-b" },
              ["svg"] = { "chafa" },
              ["jpg"] = { "ueberzug" },
            }
          }
        }
      })
      require("fzf-lua").register_ui_select()
    end,
    opts = {}
  }
}
