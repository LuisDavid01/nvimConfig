
local lspconfig = require("lspconfig")
local servers = { "ts_ls", "gopls", "pyright", "clangd", "csharp_ls", "lua_ls", "emmet_ls", "phpactor" }

for _, server in ipairs(servers) do
    local config = {
        on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }
    lspconfig[server].setup(config)

end

