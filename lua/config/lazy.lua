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
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.g.autoformat = failsafe


-- add the following xml files as vim settings
-- <setting id="org.eclipse.jdt.core.formatter.tabulation.char" value="space"/>
-- <setting id="org.eclipse.jdt.core.formatter.wrap_before_assignment_operator" value="false"/>
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--maybe not needed
--vim.opt.formatoptions = "t"

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- backups
vim.opt.swapfile= false
vim.opt.backup = false

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- colours
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"

--
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

-- noice ~ works with 'gf' command (goto file)
vim.opt.isfname:append("@-@")

-- nice border around windows
vim.opt.winborder = "rounded"

-- go to next diagnostic
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({count = 1, float = true})
end
)

--go to previous diagnostic
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end
)

--escape term mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")


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
