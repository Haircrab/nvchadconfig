local M = {}

M.cmp = function(_, opts)
  local cmp = require "cmp"
  opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { -- configs
    -- prevent double suggestion
    -- { name = "nvim_lsp", group_index = 2 },
    {
      name = "copilot",
      group_index = 2,
    },
    {
      name = "luasnip",
      group_index = 2,
    },
    {
      name = "buffer",
      group_index = 2,
    },
    {
      name = "nvim_lua",
      group_index = 2,
    },
    {
      name = "path",
      group_index = 2,
    }, -- languages
    -- { name = "crates" },
  }))
  cmp.setup {
    mapping = {
      -- ["<C-p>"] = cmp.mapping.complete(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select, count = 5 },
      ["<C-u>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select, count = 5 },
      -- ["<Tab>"] = cmp.mapping.confirm { select = true },
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-c>"] = cmp.mapping.close(),
    },
  }
end

-- for jsonls
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
          validate = {
            enable = true,
          },
        },
      },
    },
  },
}

M.treesitter = {
  ensure_installed = { -- configs
    "vim",
    "lua", -- document
    "markdown",
    "markdown_inline", -- c family
    "c", -- web
    "c_sharp",
    "html",
    "css",
    "json",
    "json5",
    "jsonc",
    "tsx",
    "vue",
    "prisma", -- main languages
    "javascript",
    "typescript",
    "python", -- rust
    "ron",
    "rust",
    "toml",
    "go", -- devops
    "terraform",
    "hcl",
    "dockerfile",
    "yaml",
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = { -- lua stuff
    "lua-language-server",
    "stylua", -- c/cpp stuff
    "clangd",
    "clang-format", -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier", -- python
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
    "omnisharp",

    -- rust
    "rust-analyzer",
    "rustfmt",
    "codelldb", -- go
    "gopls",
    "glint", -- "go-debug-adapter",
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
    "yamllint", -- sql
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

-- copilot
M.copilot = {
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
