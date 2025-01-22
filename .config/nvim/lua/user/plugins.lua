local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer, close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Couldn't find packer")
	return
end

-- Have packer use a popup window (instead of split right window)
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border  = "rounded" }
		end,
	},
}

-- Install plugins here
return packer.startup(function(use)
	-- Plugins - all GitHub repos
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from Vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used in other plugins
	use "rstacruz/vim-closer" -- Auto close parentheses when enter is pressed

	-- Colorschemes
	use "folke/tokyonight.nvim"

	-- Completion
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- Buffer completions
	use "hrsh7th/cmp-path" -- Path completions
	use "hrsh7th/cmp-cmdline" -- Cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- Snippet completions

	-- Snippets
	use "L3MON4D3/LuaSnip" -- Snippet engine
	use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
