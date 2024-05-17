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
	"clangd",
	"taplo",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local lsp = require("dylf.lsp")
local capabilities = lsp.capabilities
local on_attach = lsp.on_attach

local lspconfig = require("lspconfig")

for _, lsp_server in ipairs(servers) do
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	lspconfig[lsp_server].setup(opts)
end

lspconfig.lua_ls.setup({
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

lspconfig.rust_analyzer.setup({
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

lspconfig.ocamllsp.setup({
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = lspconfig.util.root_pattern(
		"*.opam",
		"esy.json",
		"package.json",
		".git",
		"dune-project",
		"dune-workspace"
	),
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		intelephense = {
			diagnostics = { enable = false },
			files = {
				associations = {
					"*.php",
					"*.module",
					"*.inc",
					"*.install",
					"*.test",
					"*.profile",
					"*.theme",
				},
			},
			format = { enable = false },
			licenseKey = "~/.intelephense",
			telemetry = { enabled = false },
			environment = {
				includePaths = {
					"./core/",
					"./core/includes",
					"./web/core/",
					"./web/core/includes",
					"./www/core/",
					"./www/core/includes",
					"./docroot/core/",
					"./docroot/core/includes",
					"../vendor/",
					"./vendor/",
				},
			},
		},
	},
})

local function preview_location_callback(_, result)
	if result == nil or vim.tbl_isempty(result) then
		return nil
	end
	vim.lsp.util.preview_location(result[1], {})
end

function Peek_definition()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

--- add a keybind for pea kdefinition
vim.api.nvim_set_keymap(
	"n",
	"<leader>pd",
	"<cmd>lua Peek_definition()<CR>",
	{ noremap = true, silent = true, desc = "LSP: [p]eek [d]efinition" }
)
