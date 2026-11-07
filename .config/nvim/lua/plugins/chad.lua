local chadtree_settings = {
	options = {
		close_on_open = true
	},
	keymap = {
		quit = { 'q', '<esc>' },
		collapse = { 'h' },
		rename = { '<f2>' },
	},
	view = {
		open_direction = 'right',
		window_options = {
			relativenumber = true,
		}
	}
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
