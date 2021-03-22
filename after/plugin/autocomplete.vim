if !exists('g:loaded_deoplete') || &compatible
	finish
endif

lua require('plugin.autocomplete')
