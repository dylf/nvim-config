return {
	"ziontee113/icon-picker.nvim",
	keys = {
		{
			"<leader>ii",
			function()
				vim.ui.select(
					{ "alt_font", "emoji", "html_colors", "nerd_font_v3", "symbols" },
					{ prompt = "Icon Type: " },
					function(input)
						if input ~= nil then
							vim.cmd("IconPickerNormal " .. input)
						end
					end
				)
			end,
			desc = "Insert icon",
		},
		{
			"<C-e>",
			"<cmd>IconPickerInsert emoji<cr>",
			desc = "Insert icon",
			mode = "i",
		},
	},
	opts = {
		disable_legacy_commands = true,
	},
}
