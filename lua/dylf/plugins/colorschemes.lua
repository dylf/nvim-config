return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			options = {
				transparent = true,
			},
		},
		config = function()
			vim.cmd([[colorscheme carbonfox]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
}
