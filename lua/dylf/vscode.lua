-- Only include config that is compatible with the vscode extension
require("dylf.set")
require("dylf.remap")

local vscode = require("vscode")
vim.keymap.set("n", "<Leader>ff", function()
	vscode.action("workbench.action.quickOpen")
end, { desc = "vscode find" })
vim.keymap.set("n", "<Leader>fg", function()
	vscode.action("workbench.action.findInFiles")
end, { desc = "vscode find" })
