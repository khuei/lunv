require('config.autocmds')
require('config.colors')
require('config.mappings')
require('config.settings')
require('config.statusline')

vim.cmd([[
packadd! deoplete
packadd! deoplete-lsp
packadd! fzy-native
packadd! lspconfig
packadd! plenary
packadd! popup
packadd! telescope
packadd! treesitter
packadd! ultisnips
]])
