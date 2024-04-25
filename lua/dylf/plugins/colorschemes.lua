return {
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
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
		lazy = true,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				disable_italics = true,
			})
			-- vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				transparent = true,
				italics = true,
			})
			vim.cmd([[colorscheme bluloco]])
		end,
	},
}
