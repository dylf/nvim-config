local M = {}

M.on_attach = function(_, bufnr)
	-- Helper for remapping
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>K", vim.diagnostic.open_float, "Hover Diagnostic")
	nmap("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")
	nmap("gT", vim.lsp.buf.type_definition, "[g]oto [T]ype definition")
	nmap("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")
	nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
	nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
	nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	nmap("<leader>.", vim.lsp.buf.code_action, "Code actions")
	nmap("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")

	-- Workspace functionality
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	nmap("<leader>=", vim.lsp.buf.format, "Format")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require("cmp_nvim_lsp")) then
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end

M.capabilities = capabilities

return M
