local nv_on_attach = require("plugins.configs.lspconfig").on_attach
local nv_capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- local on_attach = function(client, bufnr)
--   nv_on_attach(client, bufnr)
-- end
local on_attach = nv_on_attach

local M = {}
-- Mason servers' name
local servers = {
  "lua_ls",
  -- c family
  "clangd",
  -- web
  "jsonls",
  "cssls",
  "html",
  "tsserver",
  "prismals",
  -- python
  "pyright",
  -- csharp
  "omnisharp",
  -- golang
  "gopls",
  -- devops
  "yamlls",
  "dockerls",
  "helm_ls",
}

M.mason = { ensure_installed = servers }
M.mason_setup = function(_, opts)
  -- setup mason
  require("mason").setup(opts)
  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
  -- This will setup lsp for servers you listed above
  -- And servers you install through mason UI
  -- So defining servers in the list above is optional
  require("mason-lspconfig").setup_handlers {
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      lspconfig[server_name].setup {
        -- on_attach = function(client, bufnr)
        --   on_attach(client, bufnr)
        --   -- Add your other things here
        --   -- Example being format on save or something
        -- end,
        on_attach = on_attach,
        capabilities = nv_capabilities,
      }
    end,
    -- custom setup for a server goes after the function above
    -- Example, override rust_analyzer
    -- ["rust_analyzer"] = function()
    --   require("rust-tools").setup {}
    -- end,
    -- Another example with clangd
    -- Users usually run into different offset_encodings issue,
    -- so this is how to bypass it (kindof)
    ["clangd"] = function()
      lspconfig.clangd.setup {
        cmd = {
          "clangd",
          "--offset-encoding=utf-16", -- To match null-ls
          --  With this, you can configure server with
          --    - .clangd files
          --    - global clangd/config.yaml files
          --  Read the `--enable-config` option in `clangd --help` for more information
          "--enable-config",
        },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = nv_capabilities,
      }
    end,
    -- Example: disable auto configuring an LSP
    -- Here, we disable lua_ls so we can use NvChad's default config
    -- ["lua_ls"] = function() end,

    -- custome setting
    ["tsserver"] = function()
      local function ts_organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end
      lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = nv_capabilities,
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
        commands = {
          OrganizeImports = {
            ts_organize_imports,
            description = "Organize Imports",
          },
        },
      }
    end,

    -- ["prettier"] = function()
    -- end,

    ["omnisharp"] = function()
      lspconfig.omnisharp.setup {
        on_attach = on_attach,
        capabilities = nv_capabilities,
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        enable_editorconfig_support = true,
        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        enable_ms_build_load_projects_on_demand = false,
        -- Enables support for roslyn analyzers, code fixes and rulesets.
        enable_roslyn_analyzers = true,
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        organize_imports_on_format = true,
        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        enable_import_completion = true,
        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        sdk_include_prereleases = true,
        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        analyze_open_documents_only = false,
      }
    end,
  }
end

return M
