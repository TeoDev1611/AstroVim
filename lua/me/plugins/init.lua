require 'me.plugins.setup'
-- Load the Runtime
vim.cmd 'runtime */jetpack.vim'
require('jetpack').setup {
  --Langs
  { 'ray-x/go.nvim' },

  -- Faster
  'lewis6991/impatient.nvim',
  'nathom/filetype.nvim',

  -- Utils
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'milisims/nvim-luaref',
  'ray-x/guihua.lua',

  -- Lsp
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'tamago324/nlsp-settings.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'uga-rosa/cmp-dictionary',

  -- Colors
  'Mofiqul/vscode.nvim',
  'projekt0n/github-nvim-theme',
  'ackyshake/Spacegray.vim',
  'Yagua/nebulous.nvim',
  'sainnhe/gruvbox-material',

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  'p00f/nvim-ts-rainbow',

  -- Better Development
  'gpanders/editorconfig.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Typing
  'rhysd/accelerated-jk',
  'numToStr/Comment.nvim',
  'max397574/better-escape.nvim',
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'nacro90/numb.nvim',
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Git Tools
  'lewis6991/gitsigns.nvim',
  { 'lambdalisue/gina.vim', on = 'Gina' },

  -- Files Find And Search
  {
    'kyazdani42/nvim-tree.lua',
    on = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
  },
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',

  -- UI
  'ray-x/lsp_signature.nvim',
  'akinsho/bufferline.nvim',
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',
  'folke/todo-comments.nvim',
  'itchyny/vim-highlighturl',
  'lukas-reineke/indent-blankline.nvim',
  'davidgranstrom/nvim-markdown-preview',
  'goolord/alpha-nvim',
}
