return {
  -- ColorSchemes
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colo tokyonight-night'
    end,
  },
  -- Load the other color schemes
  'rafalbromirski/vim-aurora',
  'bluz71/vim-moonfly-colors',
  'cocopon/iceberg.vim',
  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
      {
        'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
        config = function()
          local rainbow_delimiters = require 'rainbow-delimiters'
          require('rainbow-delimiters.setup').setup {
            strategy = {
              [''] = rainbow_delimiters.strategy['global'],
              vim = rainbow_delimiters.strategy['local'],
            },
            query = {
              [''] = 'rainbow-delimiters',
              lua = 'rainbow-blocks',
            },
            priority = {
              [''] = 110,
              lua = 210,
            },
            highlight = {
              'RainbowDelimiterRed',
              'RainbowDelimiterYellow',
              'RainbowDelimiterBlue',
              'RainbowDelimiterOrange',
              'RainbowDelimiterGreen',
              'RainbowDelimiterViolet',
              'RainbowDelimiterCyan',
            },
          }
        end,
      },
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'vim',
          'markdown',
          'toml',
        },
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
      }
    end,
  },
  -- Icons
  'kyazdani42/nvim-web-devicons',
  -- UI Tools
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'BufReadPost',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
    event = 'BufAdd',
    config = true,
  },
  {
    'vigoux/notifier.nvim',
    config = true,
  },
  {
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup {}
    end,
  },

  -- Comments
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup {
        hooks = {
          pre = function()
            require('ts_context_commentstring.internal').update_commentstring {}
          end,
        },
      }
    end,
  },
  -- Accelerated JK
  {
    'rhysd/accelerated-jk',
    config = function()
      vim.cmd [[
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
  ]]
    end,
  },
  {

    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {}
    end,
  },
}
