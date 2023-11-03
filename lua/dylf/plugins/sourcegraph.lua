return {
	"sourcegraph/sg.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
	},
	-- If you have a recent version of lazy.nvim, you don't need to add this!
	build = "nvim -l build/init.lua",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>fs",
			require("sg.extensions.telescope").fuzzy_search_results,
			{ desc = "[f]ind in [s]ourcegraph" }
		)
	end,
}
