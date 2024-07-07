return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        preselect = cmp.PreselectMode.Item,
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local lspkind_icons = {
              Text = '',
              Method = '',
              Function = '',
              Constructor = ' ',
              Field = '',
              Variable = '',
              Class = '',
              Interface = '',
              Module = '硫',
              Property = '',
              Unit = ' ',
              Value = '',
              Enum = ' ',
              Keyword = 'ﱃ',
              Snippet = ' ',
              Color = ' ',
              File = ' ',
              Reference = 'Ꮢ',
              Folder = ' ',
              EnumMember = ' ',
              Constant = ' ',
              Struct = ' ',
              Event = '',
              Operator = '',
              TypeParameter = ' ',
            }
            local meta_type = vim_item.kind
            -- load lspkind icons
            vim_item.kind = lspkind_icons[vim_item.kind] .. ''

            vim_item.menu = ({
              buffer = ' Buffer',
              nvim_lsp = meta_type,
              path = ' Path',
              luasnip = ' LuaSnip',
            })[entry.source.name]

            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
        },
        performance = { debounce = 20, fetching_timeout = 284, throttle = 20 },
        snippet = {
          expand = function(args)
            if package.loaded['luasnip'] then
              require('luasnip').lsp_expand(args.body)
            else
              error 'No Snippet Engine'
            end
          end,
        },
        window = {
          completion = {
            border = 'rounded',
            scrollbar = false,
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
          },
          documentation = {
            border = 'rounded',
            winhighlight = 'FloatBorder:FloatBorder',
          },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip', max_item_count = 20 },
          { name = 'nvim_lua', max_item_count = 18 },
          { name = 'path', max_item_count = 15 },
          { name = 'buffer', keyword_length = 2, max_item_count = 15 },
        },
        experimental = {
          ghost_text = {
            hl_group = 'LspCodeLens',
          },
        },
      }
    end,
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    config = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    init = function()
      local function jump(key, dir)
        vim.keymap.set({ 'i', 's' }, key, function()
          return require('luasnip').jump(dir) or key
        end, { expr = true })
      end

      jump('<tab>', 1)
      jump('<s-tab>', -1)
    end,
  },
}
