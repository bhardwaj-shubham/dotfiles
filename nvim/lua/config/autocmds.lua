local autocmd = vim.api.nvim_create_autocmd

-- Python indentation (4 spaces)
autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- Optional: JSON/YAML (2 spaces explicitly, safer)
autocmd("FileType", {
	pattern = { "json", "yaml", "yml" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Highlight on yank (nice UX, no bloat)
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ timeout = 150 })
	end,
})

-- Remove trailing whitespace on save (clean codebase)
autocmd("BufWritePre", {
	callback = function()
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
})
