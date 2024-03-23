local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  -- web
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "prismals",
  -- server
  "clangd",
  "omnisharp",
  "gopls",
  -- devops
  "dockerls",
  "docker_compose_language_service",
  "helm_ls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end
lspconfig.tsserver.setup {
  on_init = on_init,
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
  commands = {
    OrganizeImports = {
      ts_organize_imports,
      description = "Organize Imports",
    },
  },
}

lspconfig.yamlls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml"] = "/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
      },
      format = { enabled = false },
      -- anabling this conflicts between Kubernetes resources and kustomization.yaml and Helmreleases
      -- see utils.custom_lsp_attach() for the workaround
      -- how can I detect Kubernetes ONLY yaml files? (no CRDs, Helmreleases, etc.)
      validate = false,
      completion = true,
      hover = true,
    },
  },
}

-- lspconfig.omnisharp.setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   handlers = {
--     ["textDocument/definition"] = require("omnisharp_extended").handler,
--     ["textDocument/typeDefinition"] = require("omnisharp_extended").handler,
--   },
--   -- Enables support for reading code style, naming convention and analyzer
--   -- settings from .editorconfig.
--   enable_editorconfig_support = true,
--   -- If true, MSBuild project system will only load projects for files that
--   -- were opened in the editor. This setting is useful for big C# codebases
--   -- and allows for faster initialization of code navigation features only
--   -- for projects that are relevant to code that is being edited. With this
--   -- setting enabled OmniSharp may load fewer projects and may thus display
--   -- incomplete reference lists for symbols.
--   enable_ms_build_load_projects_on_demand = false,
--   -- Enables support for roslyn analyzers, code fixes and rulesets.
--   enable_roslyn_analyzers = false,
--   -- Specifies whether 'using' directives should be grouped and sorted during
--   -- document formatting.
--   organize_imports_on_format = true,
--   -- Enables support for showing unimported types and unimported extension
--   -- methods in completion lists. When committed, the appropriate using
--   -- directive will be added at the top of the current file. This option can
--   -- have a negative impact on initial completion responsiveness,
--   -- particularly for the first few completion sessions after opening a
--   -- solution.
--   enable_import_completion = true,
--   -- Specifies whether to include preview versions of the .NET SDK when
--   -- determining which version to use for project loading.
--   sdk_include_prereleases = true,
--   -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--   -- true
--   analyze_open_documents_only = false,
-- }
