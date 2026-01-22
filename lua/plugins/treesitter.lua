return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ignore_install = {},
			indent = { enable = true },

			ensure_installed = {
				"json",
				"javascript",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"java",
			},

			sync_install = false,
			auto_install = true,

			highlight = {
				-- `false` will disable the whole extension
				enable = true,
				disable = function(lang, buf)
					-- if lang == "html" then
					-- 	print("disabled")
					-- 	return true
					-- end

					local max_filesize = 200 * 1024 -- 200 KB
                    local fileName = vim.api.nvim_buf_get_name(buf)
					local ok, stats = pcall(vim.uv.fs_stat, fileName)
                    -- disable for large files, except files with "ConstraintProvider" in the name
					if ok and stats and stats.size > max_filesize and not string.find(fileName, "ConstraintProvider") then
						vim.notify(
							"File larger than 200KB treesitter disabled for performance",
							vim.log.levels.WARN,
							{ title = "Treesitter" }
						)
						return true
					end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = { "markdown" },
			},

			rainbow = {
				enable = true,
				-- disable = { "html" },
				extended_mode = false,
				max_file_lines = nil,
			},
		})
	end,
}
