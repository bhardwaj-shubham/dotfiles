return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},

		signcolumn = true,
		numhl = false,
		linehl = false,

		current_line_blame = true, -- 🔥 shows who changed line
		current_line_blame_opts = {
			delay = 500,
			virt_text_pos = "eol",
		},

		update_debounce = 200,
		max_file_length = 40000,

		preview_config = {
			border = "rounded",
		},
	},

	config = function(_, opts)
		require("gitsigns").setup(opts)

		local gs = require("gitsigns")
		local map = vim.keymap.set

		-- 🔥 navigation
		map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
		map("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })

		-- 🔥 actions
		map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })

		map("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
		map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
	end,
}
