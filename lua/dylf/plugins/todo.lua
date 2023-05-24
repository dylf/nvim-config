return {
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>xt", "<cmd>TroubleToggle todo<cr>", desc = "Todo List (Trouble)" },
	},
	config = function()
		require("todo-comments").setup({})
	end,
}
