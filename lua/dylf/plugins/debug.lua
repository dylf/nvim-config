return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"Joakker/lua-json5",
			build = "./install.sh",
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Breakpoint Condition",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Run/Continue",
		},
		-- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
		{
			"<leader>dC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to Cursor",
		},
		{
			"<leader>dg",
			function()
				require("dap").goto_()
			end,
			desc = "Go to Line (No Execute)",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>dj",
			function()
				require("dap").down()
			end,
			desc = "Down",
		},
		{
			"<leader>dk",
			function()
				require("dap").up()
			end,
			desc = "Up",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>dP",
			function()
				require("dap").pause()
			end,
			desc = "Pause",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "Toggle REPL",
		},
		{
			"<leader>ds",
			function()
				require("dap").session()
			end,
			desc = "Session",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
		{
			"<leader>dw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "Widgets",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle({})
			end,
			desc = "Dap UI",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "Eval",
			mode = { "n", "v" },
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dap.ext.vscode").json_decode = require("json5").parse

		dap.adapters.php = {
			type = "executable",
			command = "php-debug-adapter",
		}

		-- This is a sane default config for lando sites.
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug (Default global)",
				port = 9003,
				pathMappings = {
					["/app"] = "${workspaceFolder}",
				},
			},
		}

		-- load the vscode launch config if present
		-- vscode uses json5 so this will have problems parsing a launch.json
		-- with trailing commas
		-- local continue = function()
		-- 	if vim.fn.filereadable(".vscode/launch.json") then
		-- 		require("dap.ext.vscode").load_launchjs()
		-- 	end
		-- 	dap.continue()
		-- end

		-- Basic debugging keymaps, feel free to change to your liking!
		-- vim.keymap.set("n", "<F5>", continue)
		vim.keymap.set("n", "<F1>", dap.step_into)
		vim.keymap.set("n", "<F2>", dap.step_over)
		vim.keymap.set("n", "<F3>", dap.step_out)
		-- vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle [b]reakpoint" })
		-- vim.keymap.set("n", "<leader>B", function()
		-- 	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		-- end, { desc = "DAP: [B]reakpoint with condition" })
		-- vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "DAP: [d]ebug ui [c]lose" })
		-- vim.keymap.set("n", "<leader>do", dapui.open, { desc = "DAP: [d]ebug ui [o]pen" })
		-- vim.keymap.set("n", "<leader>du", function()
		-- 	require("dapui").toggle()
		-- end, { desc = "DAP: [d]ebug [u]i" })

		-- Dap UI setup
		-- dapui.setup({
		-- 	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
		-- 	controls = {
		-- 		icons = {
		-- 			pause = "⏸",
		-- 			play = "▶",
		-- 			step_into = "⏎",
		-- 			step_over = "⏭",
		-- 			step_out = "⏮",
		-- 			step_back = "b",
		-- 			run_last = "▶▶",
		-- 			terminate = "⏹",
		-- 		},
		-- 		enabled = false,
		-- 		element = "feet",
		-- 	},
		-- })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
