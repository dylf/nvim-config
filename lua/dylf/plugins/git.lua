return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			yadm = { enable = true },
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
			{ "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "[g]it lazy[g]it" } },
		},
	},
}
