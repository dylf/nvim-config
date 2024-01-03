return {
	{
		"stevearc/oil.nvim",
		config = function()
			vim.keymap.set("n", "<Leader>e", require("oil").open, { desc = "[e]xplore files" })
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
}
