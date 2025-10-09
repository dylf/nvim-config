return {
	{
		"clavery/nvim-sfcc",
		dependencies = { "mfussenegger/nvim-dap", "neovim/nvim-lspconfig" },
		cond = function()
			return vim.fn.filereadable("dw.json") == 1 or vim.fn.filereadable("dw.js") == 1
		end,
		opts = {
			prophet_auto_download = true,
		},
		init = function()
			-- check if ./node_modules/.bin/b2c-tools exists
			local b2c_tools_path = vim.fn.expand("./node_modules/.bin/b2c-tools")
			local cli_js_path = vim.fn.expand("./b2c-tools/cli.js")
			local command

			if vim.fn.filereadable(b2c_tools_path) == 1 then
				command = string.format("%s code watch", b2c_tools_path)
				vim.notify("b2c-tools found in node_modules/.bin", vim.log.levels.INFO)
			elseif vim.fn.filereadable(cli_js_path) == 1 then
				command = string.format("node %s code watch", cli_js_path)
				vim.notify("b2c-tools found in b2c-tools/cli.js", vim.log.levels.INFO)
			else
				vim.notify("b2c-tools not found in node_modules/.bin or b2c-tools/cli.js", vim.log.levels.WARN)
				return
			end

			-- add a vim command to run b2c-tools
			vim.api.nvim_create_user_command("B2CWatch", function()
				-- Open a terminal buffer and run the command with timestamps
				vim.cmd("vsplit | terminal " .. command)
				vim.notify("b2c-tools code watch started", vim.log.levels.INFO)
			end, { desc = "Run b2c-tools in a terminal buffer" })

			vim.api.nvim_create_user_command("B2CToggle", function()
				-- Toggle the visibility of the terminal buffer
				local bufnr = vim.fn.bufnr("term://*b2c-tools*")
				if bufnr ~= -1 then
					if vim.fn.bufwinnr(bufnr) == -1 then
						vim.cmd("vsplit | buffer " .. bufnr)
					else
						local winid = vim.fn.bufwinnr(bufnr)
						if winid > 0 then
							vim.cmd(winid .. "wincmd c")
						end
					end
				else
					vim.notify("No b2c-tools output buffer found", vim.log.levels.WARN)
				end
			end, { desc = "Toggle b2c-tools output buffer" })
			vim.notify("b2c-tools found in node_modules/.bin", vim.log.levels.INFO)
		end,
	},
	{
		"xixiaofinland/sf.nvim",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ibhagwan/fzf-lua", -- no need if you don't use listing metadata feature
		},
		opts = {
			enable_hotkeys = true,
		},
	},
}
