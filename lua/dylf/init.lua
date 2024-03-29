require("dylf.set")
require("dylf.lazy")
require("dylf.remap")
require("dylf.ui")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Open telescope on startup if not opening a specific file
		if vim.bo.filetype == "" or vim.bo.filetype == "netrw" then
			vim.cmd("silent! lua require('telescope.builtin').find_files()")
		end
	end,
})

require("os")

vim.filetype.add({
	filename = {
		[os.getenv("HOME") .. "/.kube/config"] = "yaml",
	},
})
