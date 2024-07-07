-- Functions
local function sign_setup()
  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local function on_attach()
  vim.keymap.set('n', 'R', '<cmd>Lspsaga rename<CR>', { silent = true, desc = 'Rename Lspsaga' })
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', { silent = true, desc = 'Preview Lsp' })
  vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim', silent = true })
  vim.keymap.set('n', 'gD', '<cmd>Lspsaga lsp_finder<cr>', { silent = true, desc = 'Find Lsp' })
  vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)', silent = true })
end

local function diagnostics_setup()
  local diagnostics = {
    float = { header = { 'Diagnostics', 'Title' }, border = 'rounded' },
    severity_sort = true,
    virtual_text = { prefix = '🔥', spacing = 2 },
  }
  vim.diagnostic.config(diagnostics)
end

local function lsp_handlers_setup()
  require('lspconfig.ui.windows').default_options.border = 'rounded'

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
    focusable = false,
    relative = 'cursor',
  })
end

return {
  -- Snippets
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'glepnir/lspsaga.nvim', cmd = 'Lspsaga' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'lewis6991/hover.nvim',
        config = function()
          require('hover').setup {
            init = function()
              require 'hover.providers.lsp'
            end,
          }
        end,
      },
    },
    config = function()
      sign_setup()
      diagnostics_setup()
      lsp_handlers_setup()
      on_attach()

      local lspconfig = require 'lspconfig'

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('mason-lspconfig').setup()
      -- Attach

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = {
              enable = false,
            },
            workspace = { checkThirdParty = false },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
  -- -- Formatter
  -- {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   event = 'BufReadPre',
  --   config = function()
  --     local null_ls = require 'null-ls'
  --     local b = null_ls.builtins
  --     null_ls.setup {
  --       sources = {
  --         b.formatting.stylua,
  --         b.formatting.black,
  --         b.formatting.rustfmt,
  --         b.formatting.gofumpt,
  --         b.formatting.goimports,
  --         b.formatting.jq,
  --         b.formatting.deno_fmt,
  --       },
  --       debug = true,
  --       debounce = 150,
  --       save_after_format = false,
  --       root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', '.git'),
  --     }
  --     require('core.util').command('LspFormat', vim.lsp.buf.format)
  --     vim.lsp.buf.format { timeout_ms = 2000 }
  --   end,
  -- },
}
