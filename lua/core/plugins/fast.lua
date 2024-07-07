return {
  {
    'nathom/filetype.nvim',
    lazy = false,
    priority = 100,
    config = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  {
    'lewis6991/impatient.nvim',
    lazy = false,
    priority = 110,
    config = function()
      require 'impatient'
      require('impatient').enable_profile()
    end,
  },
}
