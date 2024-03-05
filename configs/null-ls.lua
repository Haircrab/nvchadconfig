local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    -- so prettier works only on these filetypes
    filetypes = {
      "html",
      "markdown",
      "css",
      "json",
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "jsx",
      "tsx",
      "vue",
    },
  },
  -- b.formatting.prismals,
  -- b.formatting.eslint_d,
  -- b.diagnostics.eslint,

  -- python
  b.formatting.black,

  -- rust
  b.formatting.rustfmt,

  -- go
  b.formatting.gofmt,
  b.formatting.goimports,

  -- cs
  b.formatting.csharpier,

  -- terraform
  b.formatting.terraform_fmt,
  b.diagnostics.terraform_validate,
}

-- for auto formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          -- vim.lsp.buf.formatting_sync()
          vim.lsp.buf.format {
            async = false,
          }
        end,
      })
    end
  end,
}
