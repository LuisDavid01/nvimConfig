--[[

local servers = { "ts_ls", "gopls", "pyright", "cssls", "rust_analyzer", "lua_ls", "bashls", "html",
	"dockerls", "marksman", "yamlls", "astro", "tailwindcss", "emmet_ls" }

]] --

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		-- Habilita omnifunc
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Keymaps
		local opts = { buffer = bufnr, noremap = true, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
	desc = "Formatear archivo con LSP al guardar",
})
