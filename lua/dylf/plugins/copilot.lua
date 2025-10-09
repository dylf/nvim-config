return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				copilot_model = "claude-3.7-sonnet",
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
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			window = {
				-- relative = "cursor",
				-- layout = "float",
				border = "rounded",
				-- width = 1,
				-- row = 1,
				-- height = 0.3,
			},
			model = "claude-3.7-sonnet",
		},
		keys = {
			{
				"<leader>aq",
				function()
					vim.ui.input({ prompt = "Quick Chat: " }, function(input)
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end)
				end,
				desc = "AI: - Quick chat",
			},
			{
				"<leader>at",
				function()
					require("CopilotChat").toggle()
				end,
				desc = "AI: - Toggle chat",
			},
			{
				"<leader>ar",
				function()
					require("CopilotChat").reset()
				end,
				desc = "AI: - Reset chat",
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
		-- @example https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
	},
}
