-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Really nice fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme
  use 'savq/melange-nvim'

  -- Incremental parsing system for editor tools
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- Creates a list of quick swap targets
  use('theprimeagen/harpoon')

  -- Undo history visualizer
  use('mbbill/undotree')

  -- Git plugin. Provides access to arbitrary git commands out of the vim
  -- command tray and for remapping
  use('tpope/vim-fugitive')

  -- Language server configuration
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Better file explorer than Ex
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  -- File tabs
  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'


  -- Integrates nvim and tmux controls
  use 'christoomey/vim-tmux-navigator'

  -- vim motions tutorial games
  use 'ThePrimeagen/vim-be-good'

  -- Shows an overlay with options after keypresses to help remind me what
  -- mappings are available
  use {
    'folke/which-key.nvim',
    config = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
      }
    end
  }

  -- Personal vim cheatsheat
  use 'tinyheero/vim-myhelp'
end)

