return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    }
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
    require('dap.ext.vscode').json_decode = require'json5'.parse

		require("mason-nvim-dap").setup({
			-- not working for php adapter?
			-- automatic_setup = true,
			ensure_installed = {
				"php",
			},
			handlers = {},
		})

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
		local continue = function()
			if vim.fn.filereadable(".vscode/launch.json") then
				require("dap.ext.vscode").load_launchjs()
			end
			dap.continue()
		end

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<F5>", continue)
		vim.keymap.set("n", "<F1>", dap.step_into)
		vim.keymap.set("n", "<F2>", dap.step_over)
		vim.keymap.set("n", "<F3>", dap.step_out)
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle [b]reakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: [B]reakpoint with condition" })
		vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "DAP: [d]ebug ui [c]lose" })
		vim.keymap.set("n", "<leader>do", dapui.open, { desc = "DAP: [d]ebug ui [o]pen" })

		-- Dap UI setup
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
