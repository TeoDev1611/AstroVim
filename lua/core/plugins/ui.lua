return {
  'kyazdani42/nvim-web-devicons',
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
    event = 'BufAdd',
    config = true,
  },
  {
    'vigoux/notifier.nvim',
    config = true,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    init = function()
      vim.cmd [[hi DashboardHeader guifg=#ee872d gui=bold]]
      vim.cmd [[hi DashboardProjectTitle guifg=#d55fde gui=bold]]
      vim.cmd [[hi DashboardProjectIcon guifg=#89ca78]]
      vim.cmd [[hi DashboardMruTitle guifg=#d55fde gui=bold]]
      vim.cmd [[hi DashboardShortCut guifg=#89ca78 gui=bold]]
    end,
    opts = {
      theme = 'hyper',
      config = {
        header = {
          [[]],
          [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
          [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
          [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
          [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
          [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
          [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          [[]],
        },
        shortcut = {
          {
            icon = ' ', --
            desc = ' Files',
            group = 'Label',
            key = 'f',
            action = 'Telescope find_files',
          },
          {
            desc = '  Find text',
            group = '@property',
            key = 'g',
            action = 'Telescope live_grep ',
          },
          {
            desc = '  New file',
            group = 'Macro',
            key = 'n',
            action = 'Neotree toggle',
          },
          {
            desc = '  Config',
            group = 'DiagnosticHint',
            key = 'c',
            action = 'e $MYVIMRC ',
          },
          {
            desc = '  Quit',
            group = 'Number',
            key = 'q',
            action = 'qa',
          },
        },
      },
      hide = {
        statusline = true, -- hide statusline default is true
        tabline = false, -- hide the tabline
        winbar = true, -- hide winbar
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
      local function total_num_lines()
        return vim.api.nvim_buf_line_count(0)
      end

      return {
        options = {
          theme = 'auto', -- "auto", "catppuccin",
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              separator = { left = '' },
              right_padding = 2,
            },
          },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = { 'encoding', 'fileformat' },
          lualine_y = { 'filetype', total_num_lines },
          lualine_z = {
            {
              'location',
              separator = { right = '' },
              left_padding = 2,
            },
          },
        },
      }
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        win_options = {
          winhighlight = 'NormalFloat:DiagnosticError',
        },
      },
    },
  },
}
