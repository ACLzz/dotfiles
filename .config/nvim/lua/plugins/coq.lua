-- config
vim.g.coq_settings = {
	clients = {
		buffers = {
			enabled = false,
		},
		registers = {
			enabled = false,
		},
		snippets = {
			weight_adjust = -1,
		}
	},
	keymap = {
		recommended = false,
		pre_select = false,
	},
	preview = {
		positions = {
			east = 1,
			south = 2,
			north = 3,
			west = 4,
		},
	},
}

vim.opt.iskeyword:append("-")                                                                                 -- fix source items which contains dash in the name
vim.api.nvim_set_keymap('i', '<c-j>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true }) -- default: Tab
vim.api.nvim_set_keymap('i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })  -- default S-Tab
