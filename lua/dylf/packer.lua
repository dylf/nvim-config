-- Ensure packer is installed.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Standard libs for most plugins
  use 'nvim-lua/plenary.nvim'

  -- colorschemes
  use 'EdenEast/nightfox.nvim'
  
  -- pretty icons
  use 'nvim-tree/nvim-web-devicons'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {'nvim-lua/plenary.nvim'} }

  -- Better perf FZF algorithm. Only load if make is available on the system.
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  --- LSP stuff
  use { 
    'neovim/nvim-lspconfig',
    requires = {
      -- auto install LSPs
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  -- Formatting and linting
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  --- autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'davidsierradz/cmp-conventionalcommits'

  -- snippets
  use {'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'}
  use 'saadparwaiz1/cmp_luasnip'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    -- Additional text objects via treesitter.
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
    
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
  }
}
})
