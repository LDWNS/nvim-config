vim.loader.enable()

require("config.set")
require("config.mapping")
require("config.lazy")

vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  group = vim.api.nvim_create_augroup("toggle_bg_on_SIGUSR1", {}),
  callback = function()
    print("loading..")
    package.loaded["config.theme"] = nil
    vim.cmd.colorscheme(require("config.theme"))
    vim.cmd("redraw!")
  end,
  nested = true,
})

vim.cmd.colorscheme(require("config.theme"))
