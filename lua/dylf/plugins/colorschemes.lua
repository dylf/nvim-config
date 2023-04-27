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

			-- vim.cmd([[colorscheme carbonfox]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		lazy = false,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
}
