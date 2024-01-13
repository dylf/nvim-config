-- Add to Godot > Editor Settings > Text Editor > External
-- Exec Path: nvim
-- Exec Flags: --server /tmp/godot.pipe --remote-send "<esc>:n {file}<CR>:call cursor({line},{col})<CR>"
local port = os.getenv("GDScript_Port") or "6005"
---@diagnostic disable-next-line: param-type-mismatch
local cmd = vim.lsp.rpc.connect("127.0.0.1", port)

local lsp = require("dylf.lsp")
local capabilities = lsp.capabilities
local on_attach = lsp.on_attach

vim.lsp.start({
	name = "Godot",
	cmd = cmd,
	root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
	on_attach = on_attach,
	capabilities = capabilities,
})
