require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'rebelot/kanagawa.nvim'
  use 'f-person/auto-dark-mode.nvim'

  -- Language server
  use 'neovim/nvim-lspconfig'

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'nvimdev/lspsaga.nvim'

  -- Auto pairing
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', branch = 'master', run = ':TSUpdate' }

  -- Language support tools
  use 'akinsho/flutter-tools.nvim'

  -- Debugging support
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-neotest/nvim-nio'
  use 'theHamsta/nvim-dap-virtual-text'

  -- File explorer & fuzzy finder
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Comment
  use 'numToStr/Comment.nvim'

  -- Status line and buffer tabs
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  -- nvim tmux navigator
  use 'alexghergh/nvim-tmux-navigation'

  -- Support other plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'
end)
