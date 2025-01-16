-- :help options

local options = {
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	number = true, -- set numbered lines
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go right of current window
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
