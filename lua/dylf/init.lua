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
