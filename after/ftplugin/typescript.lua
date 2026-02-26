local utils = require "dap.utils"
local dap = require "dap"
vim.opt_local.makeprg = "npx tsx %"
vim.keymap.set("n", "<leader><leader>", ":make<CR>")

dap.adapters = {
  ["pwa-node"] = {
    type = "server",
    port = "${port}",
    executable = {
      command = "js-debug-adapter",
      args = {
        "${port}",
      },
    },
  },
}

dap.configurations["typescript"] = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach to process ID",
    processId = utils.pick_process,
    cwd = "${workspaceFolder}",
  },
}
