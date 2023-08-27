local M = {}

M.lspconfig = {
  servers = {
    jsonls = {
      -- lazy-load schemastore when needed
      on_new_config = function(new_config)
        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
      end,
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    -- web
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "json5",
    "jsonc",
    -- c family
    "c",
    -- document
    "markdown",
    "markdown_inline",
    -- devops
    "terraform",
    "hcl",
    "dockerfile",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- devops stuff
    "terraform-ls",
    "docker-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    -- highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
