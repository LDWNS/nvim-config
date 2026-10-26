return {
  dir = vim.fn.expand("~/Documents/personal/jfr-nvim"),
  name = "jfr.nvim",
  ft = "java",
  cmd = { "JfrAnalyse", "JfrClear", "JfrToggleLenses" },
  keys = {
    { "<leader>Ja", "<cmd>JfrAnalyse<CR>",      desc = "jfr: analyse recording" },
    { "<leader>Jt", "<cmd>JfrToggleLenses<CR>", desc = "jfr: toggle lenses" },
    { "<leader>Jc", "<cmd>JfrClear<CR>",        desc = "jfr: clear lenses" },
  },
  opts = {},
}
