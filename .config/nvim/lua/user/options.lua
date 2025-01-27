-- :help options

local options = {
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	number = true, -- set numbered lines
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go right of current window
	termguicolors = true, -- set term gui colors (most terminals support this)
    showtabline = 2, -- Always show tabs
	expandtab = true, -- Convert tab to spaces
	shiftwidth = 4, -- Number of spaces inserted for each indentation
	tabstop = 4, -- Insert 4 spaces for a tab
    mouse = "a", -- Allow mouse to be used
    wrap = false, -- Display lines as one long line
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
