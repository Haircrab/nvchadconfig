local overrides = require "custom.configs.overrides"
local custom_lspconfig = require "custom.configs.lspconfig"

-- All NvChad plugins are lazy-loaded by default
---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "VeryLazy", "BufRead" },
    config = function()
      require "plugins.configs.lspconfig"
    end,
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "williamboman/mason.nvim",
        config = function(_, opts)
          custom_lspconfig.mason_setup(opts)
        end,
        dependencies = {
          {
            "williamboman/mason-lspconfig",
          },
        },
      },
      {
        "Hoffs/omnisharp-extended-lsp.nvim",
        ft = "cs",
      },
    },
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
  -- To use a extras plugin
  { import = "custom.configs.extras.better-escape" },
  { import = "custom.configs.extras.better-comment" },
  { import = "custom.configs.extras.better-todo" },
  { import = "custom.configs.extras.fzf" },
  { import = "custom.configs.extras.gitblame" },
  { import = "custom.configs.extras.harpoon" },
  { import = "custom.configs.extras.lightspeed" },
  { import = "custom.configs.extras.markdown-preivew" },
  { import = "custom.configs.extras.multi-cursor" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.ufo" },
  { import = "custom.configs.extras.undo-tree" },
  { import = "custom.configs.extras.zen-mode" },
}

return plugins
