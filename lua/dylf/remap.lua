-- netrw full
vim.keymap.set('n', '<Leader>e', '<cmd>Ex<CR>', { desc = "[e]xplore files" })
-- netrw split
vim.keymap.set('n', '<Leader>E', '<cmd>Lex 20<CR>', { desc = "Open [E]xplorer split" })

vim.keymap.set('n', '<Leader>vs', '<cmd>vsplit<CR>', { desc = "[v]ertical [s]plit" })

-- telescope
local tele = require('telescope.builtin')
local custom_tele = require('dylf.telescope')

vim.keymap.set('n', '<Leader>ff', tele.find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set('n', '<Leader>fg', tele.live_grep, { desc = "[f]ind [g]rep" })
vim.keymap.set('n', '<Leader>fb', tele.buffers, { desc = "[f]ind [b]uffers" })
vim.keymap.set('n', '<Leader>fh', tele.help_tags, { desc = "[f]ind [h]elp" })
vim.keymap.set('n', '<Leader>fc', tele.colorscheme, { desc = "[f]ind [c]olorschemes" })
vim.keymap.set('n', '<Leader>fd', tele.diagnostics, { desc = "[f]ind [d]iagnostics" })
vim.keymap.set('n', '<Leader>fB', custom_tele.curr_buf, { desc = "[f]ind in current [B]uffer" })
vim.keymap.set('n', '<Leader>fG', custom_tele.live_grep_hidden, { desc = "[f]ind [G]rep hidden" })
vim.keymap.set('n', '<Leader>u', "<cmd>UndotreeToggle<CR>", { desc = "[u]ndotree toggle" })

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- center line when using pg movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- zen toggle
vim.keymap.set('n', '<Leader>z', '<cmd>ZenMode<CR>', { desc = "[z]en mode" })

-- source current buffer
vim.keymap.set('n', '<Leader><Leader>', '<cmd>source<CR>', { desc = "<leader>source current file" })

vim.keymap.set('n', '<Leader>gg', '<cmd>LazyGit<CR>', { desc = "[g]it lazy[g]it" })
vim.keymap.set('n', '<Leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "[g]it toggle [b]lame" })
vim.keymap.set('n', '<Leader>gB', '<cmd>Gitsigns blame_line<CR>', { desc = "[g]it [B]lame current line" })
