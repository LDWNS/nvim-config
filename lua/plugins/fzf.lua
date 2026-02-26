---@diagnostic disable: missing-fields
return {
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    event = "BufReadPre",
    dependencies = {
      "nvim-mini/mini.icons",
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
      local fzf = require("fzf-lua")

      local trouble_actions = require("trouble.sources.fzf").actions
      fzf.setup({
        actions = {
          files = {
            -- default
            ["enter"]  = fzf.actions.file_edit_or_qf,
            ["ctrl-s"] = fzf.actions.file_split,
            ["ctrl-v"] = fzf.actions.file_vsplit,
            ["alt-q"]  = fzf.actions.file_sel_to_qf,
            ["alt-Q"]  = fzf.actions.file_sel_to_ll,
            ["alt-f"]  = fzf.actions.toggle_follow,
            -- custom
            ["ctrl-H"] = fzf.actions.toggle_hidden,
            ["ctrl-I"] = fzf.actions.toggle_ignore,
            ["ctrl-t"] = trouble_actions.open,
          },
        },
        files = {
          max_line_len = 10,
          path_shorten = true,
          formatter    = "path.dirname_first",
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
    end
  }
}
