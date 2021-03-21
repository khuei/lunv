require('config.settings')
require('config.statusline')
require('config.autocmds')
require('config.mappings')
require('config.colors')

vim.cmd [[packadd! deoplete]]
vim.cmd [[packadd! deoplete-lsp]]
vim.cmd [[packadd! fzy-native]]
vim.cmd [[packadd! lspconfig]]
vim.cmd [[packadd! plenary]]
vim.cmd [[packadd! popup]]
vim.cmd [[packadd! telescope]]
vim.cmd [[packadd! treesitter]]
vim.cmd [[packadd! ultisnips]]
