-- Set up mason to manage LSPs.
require("mason").setup()

local servers = {
	"rust_analyzer",
	"tsserver",
	"lua_ls",
	"yamlls",
	"dockerls",
	"astro",
	"intelephense",
	"prismals",
	"tailwindcss",
	"bashls",
	"sqlls",
	"jsonls",
	"rescriptls",
	"gopls",
	"svelte",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local on_attach = function(_, bufnr)
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

	-- Autoformat on buf write
	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

for _, lsp in ipairs(servers) do
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	lspconfig[lsp].setup(opts)
end

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},
		},
	},
})

local function preview_location_callback(_, result)
	if result == nil or vim.tbl_isempty(result) then
		return nil
	end
	vim.lsp.util.preview_location(result[1])
end

function peek_definition()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

--- add a keybind for pea kdefinition
vim.api.nvim_set_keymap(
	"n",
	"<leader>pd",
	"<cmd>lua peek_definition()<CR>",
	{ noremap = true, silent = true, desc = "LSP: [p]eek [d]efinition" }
)
