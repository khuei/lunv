local settings = {}

if vim.fn.has('autocmd') == 1 then
	vim.cmd('syntax enable')
end

if vim.fn.has('syntax') == 1 and not vim.fn.exists('g:syntax_on') then
	vim.cmd('filetype plugin indent on')
end

vim.o.autoread = true

vim.o.hidden = true

if vim.api.nvim_get_option('history') < 10000 then
	vim.o.history = 10000
end

if vim.api.nvim_get_option('tabpagemax') < 50 then
	vim.o.tabpagemax = 50
end

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

if vim.api.nvim_get_option('scrolloff') == 0 then
	vim.o.scrolloff = 1
end

if vim.api.nvim_get_option('sidescrolloff') == 0 then
	vim.o.sidescrolloff = 5
end

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.incsearch = true

if vim.fn.exists('&inccommand') == 1 then
	vim.o.inccommand = 'split'
end

if vim.fn.has('showcmd') == 1 then
	vim.o.showcmd = false
end

vim.o.completeopt = 'menuone,noinsert,noselect'

if vim.fn.exists('&wildmode') == 1 then
	vim.o.wildmenu = true
end

vim.o.splitbelow = true
vim.o.splitright = true

if vim.fn.has('statusline') == 1 then
	vim.o.laststatus = 2
	vim.o.ruler = true
end

if vim.fn.has('folding') == 1 then
	vim.o.fillchars = 'diff:∙,eob: ,fold:·,vert:┃'
	vim.o.foldmethod = 'indent'
	vim.o.foldlevelstart = 99
end

if os.getenv('TERM') == 'linux' then
	vim.o.guicursor = ''
end

if vim.fn.has('termguicolors') == 1 then
	vim.o.termguicolors = true
end

vim.o.shortmess = 'AIOTacot'

vim.wo.list = true
vim.wo.listchars = 'extends:»,nbsp:ø,precedes:«,tab:▷┅,trail:•'

return settings
