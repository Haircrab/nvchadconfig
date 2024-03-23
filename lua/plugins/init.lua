local overrides = require("configs.overrides")
local custom_lspconfig = require("configs.lspconfig")

return {
	-- lsp things
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			-- require "configs.lspconfig"
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		opts = custom_lspconfig.mason,
		dependencies = {
			"williamboman/mason-lspconfig",
			lazy = false,
			config = function()
				require("mason-lspconfig").setup()
				custom_lspconfig.mason_setup()
			end,
		},
	},
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		ft = "cs",
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		-- lazy = false,
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{
				"zbirenbaum/copilot.lua",
				event = "InsertEnter",
				opts = overrides.copilot,
			},
		},
		opts = overrides.cmp,
	},

	-- override plugin configs
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				-- config = function()
				--   require("nvim-treesitter.configs").setup {
				--   }
				-- end,
			},
		},
		opts = overrides.treesitter,
	},
	-- nvimtree
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	-- To use a extras plugins
	{ import = "plugins.extras.better-escape" },
	{ import = "plugins.extras.better-comment" },
	{ import = "plugins.extras.better-todo" },
	{ import = "plugins.extras.fzf" },
	{ import = "plugins.extras.gitblame" },
	{ import = "plugins.extras.harpoon" },
	{ import = "plugins.extras.lightspeed" },
	{ import = "plugins.extras.markdown-preivew" },
	{ import = "plugins.extras.multi-cursor" },
	{ import = "plugins.extras.swagger-preview" },
	{ import = "plugins.extras.symbols-outline" },
	{ import = "plugins.extras.trouble" },
	{ import = "plugins.extras.ufo" },
	{ import = "plugins.extras.undo-tree" },
	{ import = "plugins.extras.zen-mode" },
}
