if !exists('g:loaded_telescope') || &compatible
	finish
endif

lua require('plugin.telescope')
