return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
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
          "cpp",
					"css",
					"diff",
					"dockerfile",
					"elixir",
					"gdscript",
					"gitcommit",
					"gitignore",
          "gleam",
					"go",
					"graphql",
					"html",
					"http",
					"javascript",
					"json",
					"jsonc",
					"just",
					"kdl",
					"lua",
					"make",
					"markdown",
					"ocaml",
					"php",
					"prisma",
					"python",
					"rust",
					"scss",
					"svelte",
					"toml",
					"tsx",
					"twig",
					"typescript",
					"vim",
					"xml",
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

			-- Neovim 0.12 + current Treesitter markdown fenced-code injections can
			-- crash hover buffers while resolving the info string language. Keep the
			-- non-fence markdown injections and let hover/code fences render plainly.
			vim.treesitter.query.set("markdown", "injections", [[
((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
			]])

			require("treesitter-context").setup({
				max_lines = 3,
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
