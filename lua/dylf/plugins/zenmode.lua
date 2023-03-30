return {
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<Leader>z", "<cmd>ZenMode<CR>", desc = "[z]en mode" },
		},
		config = function()
			require("zen-mode").setup({
				window = {
					width = 0.8,
					height = 0.9,
					options = {
						signcolumn = "no",
						number = false,
						relativenumber = false,
						colorcolumn = "",
					},
				},
				plugins = {
					gitsigns = { enabled = true },
					tmux = { enabled = true },
					alacritty = {
						enabled = true,
						font = "24",
					},
				},
			})
		end,
	},
	{
		"folke/twilight.nvim",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
	},
}
