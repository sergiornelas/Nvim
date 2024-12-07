local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("config.options")
require("config.autocommands")
require("config.utils")
require("config.keymaps")

require("lazy").setup({
	defaults = {
		lazy = true,
	},
	spec = {
		{ import = "plugins" },
	},
	git = {
		timeout = 20, -- kill processes that take more than 20 seconds
	},
	ui = {
		size = { width = 0.1, height = 0.1 },
		border = "single",
		title = " Lazy",
		browser = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser",
		custom_keys = {
			-- Open lazygit log
			["<leader>l"] = {
				function(plugin)
					require("lazy.util").float_term({ "lazygit", "log" }, {
						cwd = plugin.dir,
					})
				end,
			},
			-- Open terminal in plugin dir
			["<leader>t"] = {
				function(plugin)
					require("lazy.util").float_term(nil, {
						cwd = plugin.dir,
					})
				end,
			},
		},
	},
	checker = {
		notify = false, -- get a notification when new updates are found
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"bugreport",
				"compiler",
				"ftplugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"matchparen",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"optwin",
				"rplugin",
				"rrhelper",
				"spellfile_plugin",
				"synmenu",
				"syntax",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})

-- Default colorscheme (lazygit)
vim.cmd("colorscheme gruvbox")
