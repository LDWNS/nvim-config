return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<CR>" }
        }
    },
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keys = {
            { "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>" }
        },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
        end,
    }
}
