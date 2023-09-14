return {
	"nvim-tree/nvim-web-devicons",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<Leader>u", "<cmd>UndotreeToggle<CR>", desc = "[u]ndotree toggle" },
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				RRGGBBAA = true,
				names = false,
			},
		},
		event = "BufReadPost",
	},
	{
		"rmagatti/alternate-toggler",
		keys = {
			{
				"<leader>tt",
				"<cmd> lua require('alternate-toggler').toggleAlternate()<cr>",
				desc = "toggle boolean",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}
