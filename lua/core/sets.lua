-- Defaults
vim.g.mapleader = ' '
vim.opt.syntax = 'on'
vim.opt.syntax = 'enabled'
vim.opt.filetype = 'plugin'
vim.opt.filetype = 'indent'
vim.opt.clipboard:append 'unnamedplus'
vim.opt.filetype = 'on'
vim.opt.encoding = 'UTF-8'
vim.opt.showtabline = 2
vim.opt.mouse = 'a'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.opt.fileencoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.editorconfig_enable = true
vim.cmd 'set laststatus=3'
vim.cmd 'set cursorline'
vim.cmd 'set nowritebackup'
vim.cmd 'set noshowmode'

-- Fix the colors
vim.cmd [[
highlight WinSeparator guibg=None
]]

--- AUTOCMD
local vim_group = vim.api.nvim_create_augroup('vimrc_help', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.txt',
  command = [[if &buftype == 'help' | wincmd L | endif]],
  group = vim_group,
})

vim.g.do_filetype_lua = 1
