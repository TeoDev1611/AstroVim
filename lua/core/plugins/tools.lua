return {
  -- Markdown Tools
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    keys = {
      {
        '<leader>op',
        function()
          local peek = require 'peek'
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = 'Peek (Markdown Preview)',
      },
    },
    config = { theme = 'dark' },
  },
  -- Git Tools
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = true,
  },
  {
    'lambdalisue/gina.vim',
    cmd = 'Gina',
  },
  -- Gleam Tools
  {
    'steven-mathew/gleam-cmp',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = 'toml',
    config = function()
      require('gleam-cmp').setup {}
    end,
  },

  -- Lsp Tools
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {}
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
