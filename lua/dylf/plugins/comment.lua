return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function(opts)
		require("Comment").setup(vim.tbl_extend("force", opts, {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}))
	end,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
	},
}
