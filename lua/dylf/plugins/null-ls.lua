return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enable = false,
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd.with({
					extra_filetypes = { "astro" },
				}),
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
