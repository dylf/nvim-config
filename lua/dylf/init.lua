if vim.g.vscode then
  -- Add any vscode specific config
else
  -- Neovim specific plugins
  require('dylf.packer')
  require('dylf.telescope')
  require('dylf.lsp')
  require('dylf.cmp')
  require('dylf.treesitter')
  require('dylf.lualine')
  require('dylf.zenmode')
  vim.g.netrw_banner = 0
end

require('dylf.set')
require('dylf.remap')


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 50,
    })
  end,
})
