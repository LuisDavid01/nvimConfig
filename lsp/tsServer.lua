return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript.jsx", "javascript" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayParameterNameHints = "all"
      }
    },
		javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
			}
		}
	}
}
