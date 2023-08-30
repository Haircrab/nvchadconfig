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
  "prismals",
  -- main languages
  "tsserver",
  "pyright",
  "gopls",
  "rust_analyzer",
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

lspconfig.options.tsserver = {
  keys = {
    { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
    { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
  },
}
