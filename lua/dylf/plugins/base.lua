return {
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"ggandor/leap.nvim",
	"mbbill/undotree",
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
