if !exists('g:lspconfig') || &compatible
	finish
endif

lua require('plugin.lspconfig')
