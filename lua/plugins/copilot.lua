vim.g.copilot_no_tab_map = true
return {
  "github/copilot.vim",
  keys = {
    {
      "<C-y>",
      'copilot#Accept("\\<CR>")',
      mode = "i",
      expr = true,
      replace_keycodes = false,
    },
    {
      "<leader>co",
      function()
        -- toggle copilot
        if vim.g.copilot_enabled == 1 then
          vim.g.copilot_enabled = 0
          vim.cmd("Copilot disable")
        else
          vim.g.copilot_enabled = 1
          vim.cmd("Copilot enable")
        end
      end,
      desc = "Copilot Toggle"
    },
  }
}
