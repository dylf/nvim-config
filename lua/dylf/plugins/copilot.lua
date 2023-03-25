return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					auto_refresh = true,
					keymap = {
						open = "<M-o>",
						accept = "<M-CR>",
						jump_next = "<C-n>",
					},
				},
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept_word = "<M-w>",
						accept_line = "<M-l>",
						accept = "<M-CR>",
					},
				},
			})
		end,
	},
}
