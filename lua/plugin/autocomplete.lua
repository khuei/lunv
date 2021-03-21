local autocomplete = {}

local expansion_active = false

autocomplete.setup_mappings = function()
	local opts = { noremap = true, silent = true, }

	vim.api.nvim_buf_set_keymap('i',
	vim.api.nvim_get_var('UltiSnipsJumpForwardTrigger'),
	"<C-R>=luaeval(\"require'plugin.autocomplete'.expand_or_jump('n')\")<CR>", opts)

	vim.api.nvim_buf_set_keymap('s',
	vim.api.nvim_get_var('UltiSnipsJumpForwardTrigger'),
	"<Esc>:luaeval(\"require'plugin.autocomplete'.expand_or_jump('n')\")<CR>", opts)

	vim.api.nvim_buf_set_keymap('i',
	vim.api.nvim_get_var('UltiSnipsJumpBackwardTrigger'),
	"<C-R>=luaeval(\"require'plugin.autocomplete'.expand_or_jump('p')\")<CR>", opts)

	vim.api.nvim_buf_set_keymap('s',
	vim.api.nvim_get_var('UltiSnipsJumpBackwardTrigger'),
	"<Esc>:luaeval(\"require'plugin.autocomplete'.expand_or_jump('p')\")<CR>", opts)

	local opts = { map = true, expr = true, silent = true }

	vim.api.nvim_buf_set_keymap('i', '<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"', opts)
	vim.api.nvim_buf_set_keymap('s', '<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"', opts)

	expansion_active = true
end

autocomplete.teardown_mappings = function()
	local opts = { map = true, expr = true, silent = true }
	vim.api.nvim_buf_set_keymap('i', '<CR>', '', opts)
	vim.api.nvim_buf_set_keymap('s', '<CR>', '', opts)

	expansion_active = false
end

vim.g.ulti_jump_backwards_res = 0
vim.g.ulti_jump_forwards_res = 0
vim.g.ulti_expand_res = 0

autocomplete.expand_or_jump = function(direction)
	vim.cmd('call UltiSnips#ExpandSnippet()')
	if vim.api.nvim_eval('ulti_expand_res') == 0 then
		if vim.fn.pumvisible() then
			if direction == 'n' then
				return vim.api.nvim_replace_termcodes('<C-n>', true, false, true)
			else
				return vim.api.nvim_replace_termcodes('<C-p>', true, false, true)
			end
		else
			if expansion_active then
				if direction == 'n' then
					vim.cmd('call UltiSnips#JumpForwards()')
					if vim.api.nvim_eval("exists('g:ulti_jump_forwards_res')") == 0 then
						return vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
					end
				else
					vim.cmd('call UltiSnips#JumpBackwards()')
				end
			else
				if direction == 'n' then
					return vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
				end
			end
		end
	end

	return ''
end

autocomplete.deoplete_init = function()
	local deoplete_init_done
	if deoplete_init_done then
		return
	end
	deoplete_init_done = true

	vim.cmd('call deoplete#enable()')
	vim.cmd("call deoplete#custom#source('file', 'rank', 2000)")
	vim.cmd("call deoplete#custom#source('ultisnips', 'rank', 1000)")
	vim.cmd("call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])")
end

vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'

vim.g.UltiSnipsMappingsToIgnore = {"autocomplete"}
vim.g.UltiSnipsSnippetDirectories = {"ultisnips"}

local opts = { noremap = true, expr = true }
vim.api.nvim_set_keymap('i', '<C-j>', "pumvisible() ? '<C-n>' : '<C-j>'", opts)
vim.api.nvim_set_keymap('i', '<C-k>', "pumvisible() ? '<C-p>' : '<C-k>'", opts)

vim.b.did_after_plugin_ultisnips_after = 1

if vim.api.nvim_eval("exists(':UltiSnipsEdit')") then
	local opts = { noremap = true, silent = true }

	vim.api.nvim_set_keymap('i',
	vim.api.nvim_get_var('UltiSnipsExpandTrigger'),
	"<C-R>=luaeval(\"require'plugin.autocomplete'.expand_or_jump('n')\")<CR>", opts)

	vim.api.nvim_set_keymap('s',
	vim.api.nvim_get_var('UltiSnipsExpandTrigger'),
	"<Esc>:luaeval(\"require'plugin.autocomplete'.expand_or_jump('n')\")<CR>", opts)

	vim.api.nvim_set_keymap('i',
	vim.api.nvim_get_var('UltiSnipsJumpBackwardTrigger'),
	"<C-R>=luaeval(\"require'plugin.autocomplete'.expand_or_jump('p')\")<CR>", opts)

	vim.api.nvim_set_keymap('s',
	vim.api.nvim_get_var('UltiSnipsJumpBackwardTrigger'),
	"<Esc>:luaeval(\"require'plugin.autocomplete'.expand_or_jump('p')\")<CR>", opts)
end

if vim.api.nvim_eval("has('autocmd')") then
	vim.api.nvim_command([[
	autocmd! User UltiSnipsEnterFirstSnippet
	autocmd User UltiSnipsEnterFirstSnippet lua require'plugin.autocomplete'.setup_mappings()
	autocmd! User UltiSnipsExitLastSnippet
	autocmd User UltiSnipsExitLastSnippet lua require'plugin.autocomplete'.teardown_mappings()
	]])

	if vim.api.nvim_eval("has('vim_starting')") then
		vim.api.nvim_command("autocmd CursorHold,CursorHoldI * lua require'plugin.autocomplete'.deoplete_init()")
	end
end

return autocomplete