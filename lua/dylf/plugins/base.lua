return {
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"mbbill/undotree",
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		event = "BufReadPost",
	},
	{
		"rmagatti/alternate-toggler",
		keys = {
			{
				"<leader>tb",
				"<cmd> lua require('alternate-toggler').toggleAlternate()<cr>",
				desc = "toggle boolean",
			},
		},
	},
}
