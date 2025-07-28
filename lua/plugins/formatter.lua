--k ~/nvim/lua/slydragonn/plugins/formatter.lua

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opt = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
			sh = { "beautysh" },
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
}
