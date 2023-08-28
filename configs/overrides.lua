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
    -- configs
    "vim",
    "lua",
    -- document
    "markdown",
    "markdown_inline",
    -- c family
    "c",
    -- web
    "html",
    "css",
    "json",
    "json5",
    "jsonc",
    -- main languages
    "javascript",
    "typescript",
    "tsx",
    "go",
    "rust",
    "python",
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

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- python
    "pyright",
    "flake8",
    "black",
    "mypy",
    "pydocstyle",
    "pylint",
    "pyre",
    "autoflake",
    "autopep8",
    "python-lsp-server",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- go
    "gopls",
    "glint",
    -- "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gotestsum",

    -- devops stuff
    "tflint",
    "terraform-ls",
    "docker-language-server",
    "docker-compose-language-service",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- sql
    "sqlfluff",
    "sqls",
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
