return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fo",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = function()
    ---@module "conform"
    ---@type conform.setupOpts
    return {
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "jq" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
        sh = { "beautysh" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      -- format_on_save = function(bufnr)
      --   return
      -- end,
      -- format_after_save = function(bufnr)
      --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      --     return
      --   end
      --   -- ...additional logic...
      --   return { lsp_format = "fallback" }
      -- end,
      -- Customize formatters
      formatters = {
        jq = {
          command = "jq",
          args = { "." },
        },
        prettier = {
          cwd = require("conform.util").root_file({ ".editorconfig", "package.json", ".prettierrc" }),
          require_cwd = true
        }
      },
    }
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
