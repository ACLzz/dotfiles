-- rocks.nvim bootstrap script
do
	local install_location = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rocks")

	local rocks_config = {
		rocks_path = vim.fs.normalize(install_location),
	}

	vim.g.rocks_nvim = rocks_config

	local luarocks_path = {
		vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
		vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
	}
	package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

	local luarocks_cpath = {
		vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
		vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
	}
	package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

	vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim",
		"*"))
end

if not pcall(require, "rocks") then
	local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache") --[[@as string]], "rocks.nvim")

	if not vim.uv.fs_stat(rocks_location) then
		local url = "https://github.com/lumen-oss/rocks.nvim"
		vim.fn.system({ "git", "clone", "--filter=blob:none", url, rocks_location })
		assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")
	end

	vim.cmd.source(vim.fs.joinpath(rocks_location, "bootstrap.lua"))
	vim.fn.delete(rocks_location, "rf")
end

-- visual
vim.cmd("set number")
vim.cmd("set relativenumber")
require("plugins.floating-input")
require("plugins.nvim-treesitter-context")
require("plugins.everforest")

-- behaviours
require("autocmd")

-- plugins configuration
-- require("plugins.coq")
require("plugins.blink")
require("plugins.lsp")
require("plugins.chad")
require("plugins.buffer-sticks")
require("plugins.nvimlaunch")
require("plugins.fidget")
require("plugins.crates")
require("plugins.mini-comment")
require("plugins.mini-pairs")
require("plugins.fzf-lua")
require("plugins.smart-backspace")
require("plugins.nvim-surround")
require("plugins.lualine")
require("plugins.ufo")

-- keybinds
require("keybinds")
