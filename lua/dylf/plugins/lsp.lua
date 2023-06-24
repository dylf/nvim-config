return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- auto install LSPs
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
			{ "folke/neodev.nvim", opts = {} },
			{
				"SmiteshP/nvim-navic",
				config = function()
					local icons = require("dylf.icons")
					require("nvim-navic").setup({
						icons = icons.kinds,
					})

					vim.api.nvim_create_augroup("LspAttach_navic", {})
					vim.api.nvim_create_autocmd("LspAttach", {
						group = "LspAttach_navic",
						callback = function(args)
							if not (args.data and args.data.client_id) then
								return
							end

							local bufnr = args.buf
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client.server_capabilities.documentSymbolProvider then
								require("nvim-navic").attach(client, bufnr)
							end
						end,
					})
				end,
			},
		},
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup({})

			vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = "LspAttach_inlayhints",
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr, false)
				end,
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			text = {
				spinner = "moon",
			},
		},
	},
}
