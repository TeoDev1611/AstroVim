return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
  },
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
  {
    'rainbowhxch/accelerated-jk.nvim',
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end,
  },
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {}
    end,
  },
  'gpanders/editorconfig.nvim',
}
