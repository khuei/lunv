local statusline = {}

vim.api.nvim_set_option('statusline', ' '
	.. '%<'
	.. '%F '
	.. '%m'
	.. '%r'
	.. '%y'
	.. '%w'
	.. '%='
	.. 'L: '
	.. '%l/%L '
	.. 'C: %c '
)

return statusline
