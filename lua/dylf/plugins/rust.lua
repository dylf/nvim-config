return {
	"saecki/crates.nvim",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = "BufRead Cargo.toml",
	tag = "v0.3.0",
	config = function()
		require("null-ls")

		require("crates").setup({
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
		})
	end,
}
