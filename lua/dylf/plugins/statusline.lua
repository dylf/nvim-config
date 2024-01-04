return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	config = function()
		local navic = require("nvim-navic")
		local icons = require("dylf.icons")
		local harpoon = require("harpoon.mark")

		local function harpoon_component()
			local total_marks = harpoon.get_length()

			if total_marks == 0 then
				return ""
			end

			local current_mark = "—"

			local mark_idx = harpoon.get_current_index()
			if mark_idx ~= nil then
				current_mark = tostring(mark_idx)
			end

			return string.format("󱡅 %s/%d", current_mark, total_marks)
		end

		require("lualine").setup({
			sections = {
				lualine_b = {
					{ "branch", icon = "" },
					harpoon_component,
					"diff",
					"diagnostics",
				},
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
						return icons.kinds.Copilot
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
