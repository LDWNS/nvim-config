-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
--vim.g.autoformat = false

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile= false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 4200

vim.opt.winborder = "rounded"
-- vim.opt.winpadding = 2

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({count = 1, float = true})
end
)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end
)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.opt.colorcolumn = "120"

-- set colorscheme depending on OS
local os = vim.uv.os_uname().sysname
local theme = "tokyonight"
if (os == "Darwin") then
    -- execute command to get the theme
    local fh, er = assert(io.popen("defaults read -g AppleInterfaceStyle","r"))
    local temp = fh:read("*a")
    fh:close()
    if (temp == nil or temp == "") then
        theme = "github_light"
    elseif (temp == "Dark") then
        theme = "github_dark_tritanopia"
    end
end

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { theme } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
