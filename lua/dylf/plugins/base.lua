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
		opts = {},
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
}
