local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = "all",
	sync_installed = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- False will disable the whole extension
		disable = { "" }, -- List of languages that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "" } },
}
