require 'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'lua', 'elixir', 'markdown', 'docker', 'makefile', 'vim',
	'typescript', 'json', 'yaml', 'html', 'css', 'tsx', 'go', 'heex', 'eex', 'c'
, 'r' }

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'rust', 'javascript', 'zig', 'lua', 'elixir', 'markdown', 'docker', 'makefile', 'vim',
		'typescript', 'json', 'yaml', 'html', 'css', 'tsx', 'go', 'heex', 'eex', 'c', 'r' },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
