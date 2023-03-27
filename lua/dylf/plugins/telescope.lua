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

			telescope.setup({
				defaults = {},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
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

			vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "[f]ind [g]rep" })
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
			vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
			vim.keymap.set("n", "<Leader>fc", builtin.colorscheme, { desc = "[f]ind [c]olorschemes" })
			vim.keymap.set("n", "<Leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })
			vim.keymap.set("n", "<Leader>fB", custom_tele.curr_buf, { desc = "[f]ind in current [B]uffer" })
			vim.keymap.set("n", "<Leader>fG", custom_tele.live_grep_hidden, { desc = "[f]ind [G]rep hidden" })
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
