return {
  -- ColorSchemes
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colo github_dark_high_contrast'
    end,
  },
  'folke/tokyonight.nvim',
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
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
