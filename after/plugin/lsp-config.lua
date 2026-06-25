if vim.g.vscode then
	return
end
-- Set up mason to manage LSPs.
require("mason").setup()

local servers = {
	"rust_analyzer",
	"ts_ls",
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
	"gopls",
	"svelte",
	"clangd",
	"taplo",
	"mdx_analyzer",
	"elixirls",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = false,
})

local lsp = require("dylf.lsp")
local capabilities = lsp.capabilities
local on_attach = lsp.on_attach
local util = require("lspconfig.util")

local base_config = {
	capabilities = capabilities,
	on_attach = on_attach,
}

local server_configs = {
	lua_ls = {
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
	},
	yamlls = {
		settings = {
			yaml = {
				keyOrdering = false,
			},
		},
	},
	rust_analyzer = {
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
	},
	ocamllsp = {
		cmd = { "ocamllsp" },
		filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
		root_dir = util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
	},
	clangd = {
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	},
	intelephense = {
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
	},
	gleam = {},
}

local function configure(server, opts)
	vim.lsp.config(server, vim.tbl_deep_extend("force", {}, base_config, opts or {}))
	vim.lsp.enable(server)
end

for _, server in ipairs(servers) do
	configure(server, server_configs[server])
end

configure("ocamllsp", server_configs.ocamllsp)
configure("gleam", server_configs.gleam)

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
