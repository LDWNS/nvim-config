--- ~/nvim/lua/slydragonn/plugins/mason.lua

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"ts_ls",
				"lua_ls",
				"bashls",
				"jsonls",
				"tailwindcss",
				"jdtls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"google-java-format",
			},
		})
	end,
}
