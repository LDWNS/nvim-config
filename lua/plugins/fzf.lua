---@diagnostic disable: missing-fields
return {
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    event = "BufReadPre",
    dependencies = {
      "nvim-mini/mini.icons",
      "folke/snacks.nvim",
    },
    keys = function()
      local fzf = require("fzf-lua")
      return {
        {
          '<leader>ca',
          function()
            fzf.lsp_code_actions({
              -- Filter out actions where the LSP has set a 'disabled' table/message
              filter = function(action)
                return action.disabled == nil
              end,
            })
          end,
          desc = "Fzf: lsp code actions",
          silent = true,
          mode = { "n", "v" }
        },
        { '<leader>fb', fzf.buffers,        desc = "Fzf: buffers" },
        { '<leader>fc', fzf.git_commits,    desc = "Fzf: commits" },
        { '<leader>ff', fzf.files,          desc = "Fzf: files" },
        { '<leader>fg', fzf.live_grep,      desc = "Fzf: grep" },
        { '<leader>fh', fzf.help_tags,      desc = "Fzf: vim help" },
        { '<leader>fi', fzf.git_files,      desc = "Fzf: git files" },
        { '<leader>fm', fzf.manpages,       desc = "Fzf: man" },
        { '<leader>fs', fzf.git_status,     desc = "Fzf: status" },
        { '<leader>fw', fzf.git_worktrees,  desc = "Fzf: git worktrees" },
        { '<leader>gr', fzf.lsp_references, desc = "Fzf: lsp refs" },
      }
    end,
    config = function()
      local fzf = require("fzf-lua")

      local trouble_actions = require("trouble.sources.fzf").actions
      fzf.setup({
        actions = {
          files = {
            -- default
            true,
            -- custom
            ["ctrl-H"] = fzf.actions.toggle_hidden,
            ["ctrl-g"] = fzf.actions.toggle_ignore,
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
