return {
	-- Búsqueda rápida
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	},
	-- Treesitter para resaltado de sintaxis
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- mejor que TSInstall
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua", "javascript", "typescript", "python", "go", "html", "css",
					"json", "c", "cpp", "bash", "markdown", "markdown_inline",
					"vim", "yaml", "rust", "astro"
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	}, {
	"nvim-treesitter/playground",
},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				mapping = {
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = function(fallback)
						local luasnip = require("luasnip")
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						local luasnip = require("luasnip")
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
				},
			})
		end,
	},

	-- Harpoon (versión moderna)
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

	},

	-- Undotree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
		end,
	},

	-- Git (Fugitive)
	{
		"tpope/vim-fugitive",
	},
	--lsp
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		branch = "main",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"pyright",
					"clangd",
					"emmet_ls",
					"rust_analyzer",
					"bashls",
					"jsonls",
					"yamlls",
					"html",
					"cssls",
					"tailwindcss",
					"dockerls",
					"marksman",
					"astro"
				},
				automatic_enable = false,
				automatic_installation = true,
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	-- copilot
	{
		"github/copilot.vim"
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",                            -- opcional: puedes especificar versión
		dependencies = { "rafamadriz/friendly-snippets" }, -- Snippets listos
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
