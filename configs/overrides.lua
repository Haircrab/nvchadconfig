local M = {}

M.cmp = function(_, opts)
  local cmp = require "cmp"
  opts = {
    sources = cmp.config.sources(vim.list_extend(opts.sources, { -- configs
      -- prevent double suggestion
      {
        name = "copilot",
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
      },
    })),
  }
end

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
    "kotlin",
    "java",
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
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    -- adaptive_size = true,
    -- side = "left",
    width = 40,
    preserve_window_proportions = false,
  },

  filters = {
    dotfiles = false,
    git_ignored = false,
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
