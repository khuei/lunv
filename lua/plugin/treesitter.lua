local treesitter = {}

require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	highlight = {
		enable = true
	},
}

return treesitter
