-- splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- resize windows
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize window left" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Resize window down" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Resize window up" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize window right" })

-- center line when using pg movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- center line while searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search previous" })

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- indent selected text
vim.keymap.set("v", "<", "<gv", { desc = "Indent selected text left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selected text right" })

-- save
vim.keymap.set("n", "<leader>s", vim.cmd.write, { desc = "save" })

-- explorer
vim.keymap.set("n", "<Leader>e", "<cmd>NeoTreeShowToggle<CR>", { desc = "[e]xplore files" })

-- git
vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[g]it toggle [b]lame" })
vim.keymap.set("n", "<Leader>gB", "<cmd>Gitsigns blame_line<CR>", { desc = "[g]it [B]lame current line" })

-- copy to system clipboard
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
