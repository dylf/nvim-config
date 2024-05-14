return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		opts = {
			options = {
				transparent = true,
				styles = {
					comments = "italic",
				},
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			disable_background = true,
			disable_italics = true,
		},
	},
	{
		"uloco/bluloco.nvim",
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			transparent = true,
			italics = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
}
