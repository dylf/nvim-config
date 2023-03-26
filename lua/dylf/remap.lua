-- explorer
vim.keymap.set("n", "<Leader>e", "<cmd>NeoTreeShowToggle<CR>", { desc = "[e]xplore files" })

-- splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

vim.keymap.set("n", "<Leader>u", "<cmd>UndotreeToggle<CR>", { desc = "[u]ndotree toggle" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- center line when using pg movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- zen toggle
vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>", { desc = "[z]en mode" })

-- source current buffer
vim.keymap.set("n", "<Leader><Leader>", "<cmd>source<CR>", { desc = "<leader>source current file" })

-- git
vim.keymap.set("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "[g]it lazy[g]it" })
vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[g]it toggle [b]lame" })
vim.keymap.set("n", "<Leader>gB", "<cmd>Gitsigns blame_line<CR>", { desc = "[g]it [B]lame current line" })

vim.keymap.set("n", "<leader>s", vim.cmd.write, { desc = "save" })
