local cmp = require('blink.cmp')
cmp.setup({
	keymap = {
		preset = 'none',
		['<C-j>'] = { 'select_next' },
		['<C-k>'] = { 'select_prev' },
		['<cr>'] = { 'accept', 'fallback' },
	},

	signature = {
		enabled = true,
	},

	completion = {
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			}
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 50,
			window = {
				max_height = 45,
				scrollbar = false,
				direction_priority = {
					menu_north = { 'e', 's', 'n', 'w' },
					menu_south = { 'e', 's', 'n', 'w' },
				},
			},
		},
	},
})
