if vim.o.termguicolors then
        vim.cmd("set termguicolors")
end

vim.cmd("set background=light")
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = true
vim.cmd("colorscheme everforest")
