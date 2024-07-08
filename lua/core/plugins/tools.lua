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
          else peek.open() end
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
  -- Lua Tools
  { "folke/neodev.nvim", opts = {} }
}
