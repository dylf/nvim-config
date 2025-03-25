return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			local show_ignored = false
			local toggle_gitignore = function(_prompt_bufnr)
				show_ignored = not show_ignored
				local title = show_ignored and "Find Files (ignored)" or "Find Files"
				builtin.find_files({ no_ignore = show_ignored, prompt_title = title })
			end

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-q>"] = actions.send_to_qflist,
							["<M-q>"] = actions.send_selected_to_qflist,
							["<C-l>"] = actions.send_to_loclist,
							["<M-l>"] = actions.send_selected_to_loclist,
						},
						n = {
							["<C-q>"] = actions.send_to_qflist,
							["<M-q>"] = actions.send_selected_to_qflist,
							["<C-l>"] = actions.send_to_loclist,
							["<M-l>"] = actions.send_selected_to_loclist,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--no-ignore-vcs", "--files", "--hidden", "--glob", "!**/.git/*" },
						mappings = {
							i = {
								["<C-g>"] = toggle_gitignore,
							},
							n = {
								["<C-g>"] = toggle_gitignore,
							},
						},
					},
				},
			})

			local custom_tele = {}

			custom_tele.curr_buf = function()
				local opt = require("telescope.themes").get_dropdown({ winblend = 10 })
				builtin.current_buffer_fuzzy_find(opt)
			end

			custom_tele.live_grep_hidden = function()
				builtin.live_grep({ additional_args = { "--no-ignore", "--hidden" } })
			end

      custom_tele.live_grep = function()
        builtin.live_grep({ additional_args = { "--no-ignore-vcs", "--hidden" } })
      end

			vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
			vim.keymap.set("n", "<Leader>fg", custom_tele.live_grep, { desc = "[f]ind [g]rep" })
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
			vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
			vim.keymap.set("n", "<Leader>fc", builtin.colorscheme, { desc = "[f]ind [c]olorschemes" })
			vim.keymap.set("n", "<Leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })
			vim.keymap.set("n", "<Leader>fB", custom_tele.curr_buf, { desc = "[f]ind in current [B]uffer" })
			vim.keymap.set("n", "<Leader>fG", custom_tele.live_grep_hidden, { desc = "[f]ind [G]rep hidden" })
			vim.keymap.set("n", "<Leader>f*", builtin.grep_string, { desc = "find word under cursor" })

			-- Make telescope window transparent
			vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptCounter", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cmd = "Telescope",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
