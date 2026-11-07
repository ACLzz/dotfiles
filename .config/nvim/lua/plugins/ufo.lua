require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { 'lsp', 'indent' }
	end
})

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = '1'
