return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					styles = {
						comments = "italic",
					},
				},
			})

			vim.cmd([[colorscheme carbonfox]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
	},
}
