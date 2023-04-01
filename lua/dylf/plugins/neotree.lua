return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = true,
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
				components = {
					harpoon_index = function(config, node)
						-- Check if harpoon is present
						local ok, mark = pcall(require, "harpoon.mark")
						if not ok then
							return {}
						end
						local path = node:get_id()
						local success, index = pcall(mark.get_index_of, path)
						if success and index and index > 0 then
							return {
								text = string.format("  %d ", index),
								highlight = config.highlight or "NeoTreeDirectoryIcon",
							}
						else
							return {}
						end
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name", use_git_status_colors = true },
						{ "harpoon_index" },
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
		})
	end,
}
