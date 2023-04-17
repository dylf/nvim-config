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
				},
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					function()
						local client = require("copilot.client")
						if client.is_disabled() then
							return " "
						end
						return " "
					end,
				},
			},
			extensions = {
				"neo-tree",
				"nvim-dap-ui",
				"quickfix",
			},
		})
	end,
}
