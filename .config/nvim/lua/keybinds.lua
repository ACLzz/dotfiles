-- helper functions
local function bind(keymap, action)
	vim.api.nvim_set_keymap('n', keymap, action, { noremap = true, silent = true })
end

-- neovim control stuff
vim.g.mapleader = " "
vim.cmd("set mouse=")

-- windows navigation
bind('<c-h>', '<c-w>h')
bind('<c-j>', '<c-w>j')
bind('<c-k>', '<c-w>k')
bind('<c-l>', '<c-w>l')
bind("\\", ':vsplit<cr>')
bind('|', ':split<cr>')

-- buffer navigation
bind('<Tab>', ':lua BufferSticks.list()<cr>')
bind('<Leader>d', ':bp<bar>sp<bar>bn<bar>bd<cr>')

-- explorer control
bind('<Leader>e', ':CHADopen<cr>')

-- coderun
bind('<f5>', ':NvimLaunch<cr>')

-- code navigation
function peek_fold()
	local winid = require('ufo').peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end

bind('<f1>', ':lua vim.diagnostic.open_float()<cr>')
bind('<f2>', ':lua vim.lsp.buf.rename()<cr>')
bind('<Leader>/', ':lua FzfLua.live_grep()<cr>')
bind('grr', ':lua FzfLua.lsp_references()<cr>')
bind('gri', ':lua FzfLua.lsp_implementations()<cr>')
bind('gra', ':lua FzfLua.lsp_code_actions()<cr>')
bind('<Leader>cf', ':Crates show_features_popup<cr>')
bind('gd', ':lua FzfLua.lsp_definitions()<cr>')
bind('<Leader>dd', ':lua FzfLua.diagnostics_document()<cr>')
bind('<Leader>dw', ':lua FzfLua.diagnostics_workspace()<cr>')
bind('<esc>', ':silent! nohlsearch|diffupdate|normal<cr>')
bind('zR', ":lua require('ufo').openAllFolds()<cr>")
bind('zM', ":lua require('ufo').closeAllFolds()<cr>")
bind('zK', ":lua peek_fold()<cr>")
