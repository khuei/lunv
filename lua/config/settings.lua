local settings = {}

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.o.autoread = true

vim.o.hidden = true

vim.o.history = 10000

vim.o.tabpagemax = 50

vim.o.updatetime = 100

vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

vim.bo.autoindent = true
vim.o.backspace = 'indent,start,eol'
vim.o.smarttab = true

vim.bo.tabstop = 8
vim.bo.softtabstop = 8
vim.bo.shiftwidth = 8
vim.o.shiftround = true
vim.bo.expandtab = false

vim.o.scrolloff = 1
vim.o.sidescrolloff = 5

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.incsearch = true

vim.o.inccommand = 'split'
vim.o.showcmd = false

vim.o.completeopt = 'menuone,noinsert,noselect'

vim.o.wildmenu = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.laststatus = 2
vim.o.ruler = true

vim.o.fillchars = 'diff:∙,eob: ,fold:·,vert:┃'

vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99

vim.o.termguicolors = true

vim.o.shortmess = 'AIOTacot'

vim.wo.list = true
vim.wo.listchars = 'extends:»,nbsp:ø,precedes:«,tab:▷┅,trail:•'

return settings
