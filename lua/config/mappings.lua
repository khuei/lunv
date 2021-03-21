local mappings = {}

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)

vim.api.nvim_set_keymap('n', '<Leader>n', ':nohlsearch<CR>', opts)

vim.api.nvim_set_keymap('n', '<LocalLeader>e', ":edit <C-R>=expand('%:p:h') . '/'<CR>", opts)

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<Leader>zz', ':%s/\\s\\+$//e<CR>', opts)

vim.api.nvim_set_keymap('n', '<Up>', ':cprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<Down>', ':cnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<Left>', ':cpfile<CR>', opts)
vim.api.nvim_set_keymap('n', '<Right>', ':cnfile<CR>', opts)

vim.api.nvim_set_keymap('n', '<S-Up>', ':lprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Down>', ':lnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Left>', ':lpfile<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Right>', ':lnfile<CR>', opts)

local opts = { noremap = true, expr = true }

vim.api.nvim_set_keymap('n', 'k', '(v:count > 2 ? "m\'" . v:count : \'\') . \'k\'', opts)
vim.api.nvim_set_keymap('n', 'j', '(v:count > 2 ? "m\'" . v:count : \'\') . \'j\'', opts)

vim.api.nvim_set_keymap('c', '<Tab>', "getcmdtype() =~ '[/?]' ? '<CR>/<C-r>/' : '<C-z>'", opts)
vim.api.nvim_set_keymap('c', '<S-Tab>', "getcmdtype() =~ '[/?]' ? '<CR>?<C-r>/' : '<S-Tab>'", opts)

return mappings
