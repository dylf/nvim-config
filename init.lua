-- When using vscode only load settings and keymaps
if vim.g.vscode then
	require("dylf.vscode")
	return
end

require("dylf")
