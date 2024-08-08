return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      rust = { 'rustfmt' },
      typescript = { 'deno_fmt' },
      markdown = { 'deno_fmt' },
      json = { 'deno_fmt' },
      toml = { 'taplo' },
      go = { 'gofmt', 'goimports', 'gofumpt' },
      gleam = { 'gleam' },
      zig = { 'zigfmt' },
      yaml = { 'yamlfmt' },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
  },
  init = function()
    vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
  end,
}
