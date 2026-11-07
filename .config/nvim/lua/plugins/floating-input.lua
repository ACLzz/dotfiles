local function window_center(input_width)
	return {
		relative = "win",
		row = vim.api.nvim_win_get_height(0) / 2 - 1,
		col = vim.api.nvim_win_get_width(0) / 2 - input_width / 2,
	}
end

local function under_cursor()
	return {
		relative = "cursor",
		row = 1,
		col = 0,
	}
end

local function input(opts, on_confirm)
	local prompt = opts.prompt or "Input: "
	local default = opts.default or ""
	win_config = win_config or {}
	on_confirm = on_confirm or function() end

	local prev_win = vim.api.nvim_get_current_win()
	local prev_cursor = vim.api.nvim_win_get_cursor(prev_win)

	-- Calculate a minimal width with a bit buffer
	local default_width = vim.str_utfindex(default, 'utf-8') + 10
	local prompt_width = vim.str_utfindex(prompt, 'utf-8') + 10
	local input_width = default_width > prompt_width and default_width or prompt_width

	local default_win_config = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		width = input_width,
		height = 1,
		title = prompt,
	}

	-- Apply user's window config.
	win_config = vim.tbl_deep_extend("force", default_win_config, win_config)

	-- Place the window near cursor or at the center of the window.
	if prompt == "New Name: " then
		win_config = vim.tbl_deep_extend("force", win_config, under_cursor())
	else
		win_config = vim.tbl_deep_extend("force", win_config, window_center(win_config.width))
	end

	-- Create floating window.
	local buffer = vim.api.nvim_create_buf(false, true)
	local window = vim.api.nvim_open_win(buffer, true, win_config)
	vim.api.nvim_buf_set_text(buffer, 0, 0, 0, 0, { default })

	-- Put cursor at the end of the default value
	vim.api.nvim_win_set_cursor(window, { 1, vim.str_utfindex(default, 'utf-8') + 1 })

	-- Enter to confirm
	vim.keymap.set({ "i" }, "<cr>", function()
		vim.cmd("stopinsert")
	end, { buffer = buffer })

	vim.keymap.set({ "n", "v" }, "<cr>", function()
		local lines = vim.api.nvim_buf_get_lines(buffer, 0, 1, false)
		vim.cmd("stopinsert")
		vim.api.nvim_win_close(window, true)
		on_confirm(lines[1])
		vim.api.nvim_win_set_cursor(prev_win, prev_cursor)
	end, { buffer = buffer })

	-- Esc or q to close
	vim.keymap.set("n", "<esc>", function()
		vim.cmd("stopinsert")
		vim.api.nvim_win_close(window, true)
		on_confirm()
		vim.api.nvim_win_set_cursor(prev_win, prev_cursor)
	end, { buffer = buffer })
	vim.keymap.set("n", "q", function()
		vim.cmd("stopinsert")
		vim.api.nvim_win_close(window, true)
		on_confirm()
		vim.api.nvim_win_set_cursor(prev_win, prev_cursor)
	end, { buffer = buffer })
end

vim.ui.input = function(opts, on_confirm)
	opts = opts or {}
	input(opts, on_confirm)
end
