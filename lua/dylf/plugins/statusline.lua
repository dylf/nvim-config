return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	config = function()
		local navic = require("nvim-navic")

		require("lualine").setup({
			sections = {
				lualine_c = {
					function()
						return navic.get_location()
					end,
					cond = navic.is_available,
				},
			},
		})
	end,
}
