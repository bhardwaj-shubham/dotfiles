return {
	"kdheepak/lazygit.nvim",
	cmd = "LazyGit", -- ✅ only loads when you call it

	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
