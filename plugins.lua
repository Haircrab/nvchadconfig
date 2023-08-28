local overrides = require "custom.configs.overrides"

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

  -- override plugin configs
  -- mason
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- nvimtree
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "b0o/SchemaStore.nvim",
    version = false, -- last release is way too old
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- To use a extras plugin
  { import = "custom.configs.extras.copilot" },
  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.lightspeed" },
  { import = "custom.configs.extras.ufo" },
  { import = "custom.configs.extras.gitgraph" },
}

return plugins
