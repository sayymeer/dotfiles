return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "VeryLazy" }, -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				automatic_installation = true, -- auto-install LSPs
			})
		end,
		opts = {
			automatic_installation = true,
			pkgs = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
				"clangd",
				"clang-format",
				"gopls",
				"gofumpt",
				"goimports",
				"typescript-language-server",
				"eslint-lsp",
				"codelldb",
				"rustfmt",
				"pyright",
				"r-languagserver",
				"rust-analyzer",
				"black",
				"isort",
				"pylint",
				"eslint_d",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"bash",
				"c",
				"cpp",
				"diff",
				"luadoc",
				"markdown",
				"go",
				"rust",
				"json",
				"yaml",
				"gitignore",
				"dockerfile",
				"python",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
	},

	--dap plugin
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			automatic_installation = true,
			ensure_installed = { "delve" },
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			-- require("core.utils").load_mappings "dap"
		end,
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
			--require("core.utils").load_mappings("gopher")
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
			-- Set pylint to work in virtualenv
			require("lint").linters.pylint.cmd = "python"
			require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		event = "VeryLazy",
		ft = "python",
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup({
				auto_refresh = true,
				-- path = "/home/sameer/code/",
				-- search_venv_managers = false,
				search = true,
				parents = 4,
				-- name = { ".venv", "venv" },
			})
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			-- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		ensure_installed = {
			"lua-language-server",
			"stylua",
			"html-lsp",
			"css-lsp",
			"prettier",
			"clangd",
			"gopls",
			"typescript-language-server",
			"eslint-lsp",
			"pyright",
			"r-languagserver",
			"rust-analyzer",
			"black",
			"eslint_d",
		},
	},
}
