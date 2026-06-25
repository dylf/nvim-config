return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "[g]it toggle [b]lame" },
			{ "<Leader>gB", "<cmd>Gitsigns blame_line<CR>", desc = "[g]it [B]lame current line" },
			{ "<Leader>gd", "<cmd>Gitsigns diffthis<CR>", desc = "[g]it [d]iff" },
			{ "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "[g]it [r]eset hunk" },
		},
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<Leader>gg", "<cmd>LazyGit<CR>", desc = "[g]it lazy[g]it" },
		},
	},
}
