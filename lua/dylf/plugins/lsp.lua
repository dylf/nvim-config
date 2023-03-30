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
					require("nvim-navic").setup({
						icons = {
							File = " ",
							Module = " ",
							Namespace = " ",
							Package = " ",
							Class = " ",
							Method = " ",
							Property = " ",
							Field = " ",
							Constructor = " ",
							Enum = " ",
							Interface = " ",
							Function = " ",
							Variable = " ",
							Constant = " ",
							String = " ",
							Number = " ",
							Boolean = " ",
							Array = " ",
							Object = " ",
							Key = " ",
							Null = " ",
							EnumMember = " ",
							Struct = " ",
							Event = " ",
							Operator = " ",
							TypeParameter = " ",
						},
					})
				end,
			},
		},
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		-- event = "BufReadPre",
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
		event = "LspAttach",
		opts = {
			text = {
				spinner = "moon",
			},
		},
	},
}
