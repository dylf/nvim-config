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
				filetypes = {
					markdown = true,
				},
			})

			vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot enable" })
			vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot disable" })
		end,
	},
}
