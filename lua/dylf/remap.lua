-- netrw full
vim.keymap.set('n', '<Leader>e', '<cmd>Ex<CR>')
-- netrw split
vim.keymap.set('n', '<Leader>E', '<cmd>Lex 20<CR>')

vim.keymap.set('n', '<Leader>vs', '<cmd>vsplit<CR>')

-- telescope
local tele = require('telescope.builtin')
local custom_tele = require('dylf.telescope')

vim.keymap.set('n', '<Leader>ff', tele.find_files, {})
vim.keymap.set('n', '<Leader>fg', tele.live_grep, {})
vim.keymap.set('n', '<Leader>fb', tele.buffers, {})
vim.keymap.set('n', '<Leader>fh', tele.help_tags, {})
vim.keymap.set('n', '<Leader>fc', tele.colorscheme, {})
vim.keymap.set('n', '<Leader>fd', tele.diagnostics, {})
vim.keymap.set('n', '<Leader>fB', custom_tele.curr_buf, {})

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>PS', '<cmd>PackerSync<CR>')

-- center line when using pg movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
