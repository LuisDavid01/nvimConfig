
return {
	require('nvim-lspconfig')
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

  cmd = { "omnishard" },
  filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets', 'tproj', 'slngen', 'fproj' },
  root_markers = { "*.sln", "*.csproj", ".git" },
  settings = {


	},
}


