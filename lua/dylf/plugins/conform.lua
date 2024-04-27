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
			astro = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			svelte = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			ocaml = { { "ocamlformat" } },
			["ocaml.menhir"] = { { "ocamlformat" } },
			["ocaml.interface"] = { { "ocamlformat" } },
			["ocaml.ocamllex"] = { { "ocamlformat" } },
			reason = { { "ocamlformat" } },
			dune = { { "ocamlformat" } },
			-- php = { { "phpcbf_lando" } },
			php = { { "phpcbf" } },
			go = { { "gofmt" } },
		},
		formatters = {
			phpcbf_lando = {
				command = "lando",
				-- $FILENAME is absolute
				-- needs to be made relative to the project root
				args = { "phpcbf", "$FILENAME" },
				-- stdin
				cwd = function()
					require("conform.utils").root_file(".lando.yml")
				end,
				tmpfile_format = "conform.$RANDOM.$FILENAME",
				-- 0: no errors found
				-- 1: errors found
				-- 2: fixable errors found
				-- 3: processing error
				exit_codes = { 0, 1, 2 },
			},
		},
	},
}
