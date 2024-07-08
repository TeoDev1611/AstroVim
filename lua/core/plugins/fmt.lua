return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    config = function()
      local null_ls = require 'null-ls'
      local b = null_ls.builtins
      null_ls.setup {
        sources = {
          b.formatting.stylua,
          b.formatting.black,
          b.formatting.rustfmt,
          b.formatting.gofumpt,
          b.formatting.goimports,
          b.formatting.jq,
          b.formatting.deno_fmt,
        },
        debug = true,
        debounce = 150,
        save_after_format = false,
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', '.git'),
      }
      require('core.util').command('LspFormat', vim.lsp.buf.format)
      vim.lsp.buf.format { timeout_ms = 2000 }
      vim.api.nvim_create_augroup('__formatter__', { clear = true })
      vim.api.nvim_create_autocmd('BufWritePost', {
        group = '__formatter__',
        command = ':LspFormat',
      })
    end,
  },
}
