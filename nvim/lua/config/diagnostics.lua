-- 🔥 Minimal + clean diagnostics

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
		severity = { min = vim.diagnostic.severity.WARN }, -- ✅ hide hints/info inline
	},

	signs = true,

	underline = true,

	update_in_insert = false,
	severity_sort = true,

	float = {
		border = "rounded",
		source = "always",
	},
})
