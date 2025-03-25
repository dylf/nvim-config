return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
			lsp_fallback = false,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			astro = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			ocaml = { "ocamlformat" },
			["ocaml.menhir"] = { "ocamlformat" },
			["ocaml.interface"] = { "ocamlformat" },
			["ocaml.ocamllex"] = { "ocamlformat" },
			reason = { "ocamlformat" },
			dune = { "ocamlformat" },
			php = { "phpcbf" },
			go = { "gofmt" },
		},
	},
}
