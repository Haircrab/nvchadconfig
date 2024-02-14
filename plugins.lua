local overrides = require "custom.configs.overrides"

-- All NvChad plugins are lazy-loaded by default
---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig

    opts = overrides.lspconfig,
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = overrides.cmp,
  },

  -- override plugin configs
  -- mason
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-treesitter.configs").setup {
            autotag = {
              enable = true,
              enable_rename = true,
              enable_close = true,
              enable_close_on_slash = true,
            },
          }
        end,
      },
    },
    opts = overrides.treesitter,
  },

  -- nvimtree
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  {
    "f-person/git-blame.nvim",
    lazy = false,
    config = function()
      require("gitblame").setup {
        --Note how the `gitblame_` prefix is omitted in `setup`
        enabled = true,
      }
    end,
  },

  -- Install a plugin
  -- To use a extras plugin
  { import = "custom.configs.extras.better-escape" },
  { import = "custom.configs.extras.better-comment" },
  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.gitgraph" },
  { import = "custom.configs.extras.harpoon" },
  { import = "custom.configs.extras.json-schema" },
  { import = "custom.configs.extras.lightspeed" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.multi-cursor" },
  { import = "custom.configs.extras.lang-rust-crates" },
  { import = "custom.configs.extras.lang-rust-tools" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.ufo" },
  { import = "custom.configs.extras.undo-tree" },
  { import = "custom.configs.extras.zen-mode" },
}

return plugins
