return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', ':Telescope fd<CR>' },
    },
  },
  -- File Tree
  {
    'nvim-tree/nvim-tree.lua',
    config = true,
    keys = {
      { '<leader>n', ':NvimTreeToggle<CR>' },
    },
  },
}
