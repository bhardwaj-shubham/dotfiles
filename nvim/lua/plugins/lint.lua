return {
	"mfussenegger/nvim-lint",

	event = { "BufReadPre", "BufNewFile" },

	keys = {
		{
			"<leader>cl",
			function()
				require("lint").try_lint()
			end,
			desc = "Lint file",
		},
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff" },
			sh = { "shellcheck" },
		}

		local augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
