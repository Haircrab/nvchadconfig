local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- c family
  "clangd",
  -- web
  "jsonls",
  "html",
  "cssls",
  "volar",
  -- "tailwindcss",
  "prismals",
  -- main languages
  -- "tsserver",
  "pyright",
  "gopls",
  "rust_analyzer",
  "omnisharp",
  -- devops
  "yamlls",
  "terraformls",
  "dockerls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      inlayHints = {
        parameterTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
  },
}

local lua_server = {
  "lua_ls",
  "lua",
  "sumneko_lua",
}
for _, lsp in ipairs(lua_server) do
  lspconfig[lsp].setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end
