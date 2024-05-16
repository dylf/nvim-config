return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"nkrkv/nvim-treesitter-rescript",
		},
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				ignore_install = {},
				modules = {},
				auto_install = false,
				ensure_installed = {
					"astro",
					"bash",
					"css",
					"diff",
					"dockerfile",
					"elixir",
					"gdscript",
					"gitcommit",
					"gitignore",
					"go",
					"graphql",
					"html",
					"http",
					"javascript",
					"json",
					"kdl",
					"lua",
					"make",
					"markdown",
					"ocaml",
					"php",
					"prisma",
					"python",
					"rescript",
					"rust",
					"scss",
					"svelte",
					"toml",
					"tsx",
					"twig",
					"typescript",
					"vim",
					"yaml",
				},
				highlight = {
					enable = true,
					-- disable = function(_, buf)
					-- 	local max_filesize = 100 * 1024 -- 100 KB
					-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- 	if ok and stats and stats.size > max_filesize then
					-- 		return true
					-- 	end
					-- end,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						scope_incremental = "<CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<C-n>"] = "@parameter.inner",
						},
						swap_previous = {
							["<C-p>"] = "@parameter.inner",
						},
					},
				},
				endwise = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})

			require("treesitter-context").setup({
				patterns = {
					typescript = {
						"const",
					},
				},
			})
			vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" })
		end,
	},
}
