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
    ---@class conform.setupOpts
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
      -- Customize formatters
      formatters = {
        jq = {
          command = "jq",
          args = { "." },
        },
        -- prettierd = {
        --   cwd = require("conform.util").root_file({ ".editorconfig", "package.json", ".prettierrc" }),
        --   require_cwd = true
        -- }
      },
    }
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
