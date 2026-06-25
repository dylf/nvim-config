return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- copilot_model = "claude-3.7-sonnet",
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
						accept_word = "<C-SHIFT-W>",
						accept_line = "<C-L>",
						accept = "<C-B>",
					},
				},
				filetypes = {
					markdown = true,
				},
			})

			vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot enable" })
			vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot disable" })
		end,
	},
}
