local lspconfig = require("lspconfig")
local servers = { "rust_analyzer", "ts_ls", "gopls", "omnisharp", "pyright", "clangd" }
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

    if server == "omnisharp" then
        config.cmd = {
            "C:/Users/luisd/AppData/Local/nvim-data/mason/packages/omnisharp/OmniSharp.cmd",
            "--languageserver",
            "--hostPID",
            tostring(vim.fn.getpid()),
            "DotNet:enablePackageRestore=false",
            "--encoding",
            "utf-8",
            "Sdk:IncludePrereleases=true",
            "FormattingOptions:EnableEditorConfigSupport=true",
        }
        config.root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git")
	end
    lspconfig[server].setup(config)
end
