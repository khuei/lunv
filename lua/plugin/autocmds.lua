local autocmds = {}

local winhighlight_blurred = table.concat({
	'CursorLineNr:LineNr',
	'StatusLine:LineNr',
	'EndOfBuffer:ColorColumn',
	'IncSearch:ColorColumn',
	'Normal:ColorColumn',
	'NormalNC:ColorColumn',
	'SignColumn:ColorColumn'
}, ',')

local focus_window = function()
	vim.api.nvim_win_set_option(0, 'winhighlight', '')
end

local blur_window = function()
	vim.api.nvim_win_set_option(0, 'winhighlight', winhighlight_blurred)
end

local set_cursorline = function(active)
	vim.api.nvim_win_set_option(0, 'cursorline', active)
end

autocmds.buf_enter = function()
	focus_window()
end

autocmds.focus_gained = function()
	focus_window()
end

autocmds.focus_lost = function()
	blur_window()
end

autocmds.insert_enter = function()
	set_cursorline(false)
end

autocmds.insert_leave = function()
	set_cursorline(true)
end

autocmds.vim_enter = function()
	set_cursorline(true)
	focus_window()
end

autocmds.win_enter = function()
	set_cursorline(true)
	focus_window()
end

autocmds.win_leave = function()
	set_cursorline(false)
	blur_window()
end

if vim.fn.has('autocmd') == 1 then
	vim.cmd("autocmd BufEnter * lua require'config.autocmds'.buf_enter()")
	vim.cmd("autocmd FocusGained * lua require'config.autocmds'.focus_gained()")
	vim.cmd("autocmd FocusLost * lua require'config.autocmds'.focus_lost()")
	vim.cmd("autocmd InsertEnter * lua require'config.autocmds'.insert_enter()")
	vim.cmd("autocmd InsertLeave * lua require'config.autocmds'.insert_leave()")
	vim.cmd("autocmd VimEnter * lua require'config.autocmds'.vim_enter()")
	vim.cmd("autocmd WinEnter * lua require'config.autocmds'.win_enter()")
	vim.cmd("autocmd WinLeave * lua require'config.autocmds'.win_leave()")
	vim.cmd("autocmd TextYankPost * lua vim.highlight.on_yank{timeout=200}")
end

return autocmds
