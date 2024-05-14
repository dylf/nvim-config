require("dylf.set")
require("dylf.lazy")
require("dylf.remap")
require("dylf.ui")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.filetype.add({
	extension = {
		module = "php",
		inc = "php",
		install = "php",
		profile = "php",
		test = "php",
		info = "ini",
	},
	filename = {
		["~/.kube/config"] = "yaml",
	},
	pattern = {
		["~/.config/zsh/.*"] = "zsh",
		[".*"] = {
			priority = -math.huge,
			function(_, bufnr)
				-- check if the file opens with <?php
				local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
				if vim.regex([[<?php]]):match_str(content) ~= nil then
					return "php"
				end
			end,
		},
	},
})
