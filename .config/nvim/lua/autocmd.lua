-- format file on buffer write
vim.api.nvim_create_autocmd({ "BufWrite" }, {
	callback = function(ev)
		vim.lsp.buf.format()
	end
})

-- set tabs width based on file extension
local tabs_cfg = {
	{
		exts = {
			"slint",
		},
		tabwidth = 4,
	}
};

local function array_contains(arr, item)
	for _, _item in ipairs(arr) do
		if _item == item then
			return true
		end
	end

	return false
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("tabset", { clear = true }),
	callback = function(_)
		for _, cfg in ipairs(tabs_cfg) do
			if array_contains(cfg.exts, vim.o.filetype) then
				local tabwidth = cfg.tabwidth;

				vim.opt.tabstop = tabwidth;
				vim.opt.softtabstop = tabwidth;
				vim.opt.shiftwidth = tabwidth;
			end
		end
	end
})

-- enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client ~= nil and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

-- bind fzf-lua file search in chadtree
vim.api.nvim_create_autocmd("FileType", {
	pattern = "CHADTree",
	callback = function()
		vim.keymap.set("n", "/", function()
			require("chadtree").Open()
			require("fzf-lua").files()
		end, { buffer = true })
	end,
})
