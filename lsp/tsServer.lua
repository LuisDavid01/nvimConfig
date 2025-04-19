return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayParameterNameHints = "all"
      }
    }
  }
}
