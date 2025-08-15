return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            -- toggles breakpoint
            vim.keymap.set("n", "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", {})
        end,
    },
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()

            vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", {})
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
        end,
    }
}
