-- Mappings
vim.keymap.set('n', '<C-left>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-right>', ':wincmd l<CR>', { silent = true })
vim.keymap.set('n', '<C-up>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-down>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

-- Up lines
vim.keymap.set('x', 'K', function()
  vim.cmd [[move '<-2<CR>gv-gv]]
end)
vim.keymap.set('x', 'J', function()
  vim.cmd [[move '>+1<CR>gv-gv]]
end)

-- Move lines
vim.keymap.set('v', '>', [[>gv]])
vim.keymap.set('v', '<', [[<gv]])
