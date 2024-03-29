-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

local nv_capabilities = capabilities
local nv_on_attach = on_attach
local nv_on_init = on_init
nv_capabilities.textDocument.foldingRange = {
	-- dynamicRegistration = false,
	lineFoldingOnly = true,
}

local M = {}

M.mason = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua", -- format
		-- web
		"html-lsp",
		"css-lsp",
		"json-lsp",
		"prettier", -- format
		"typescript-language-server",
		"prisma-language-server",
		-- server
		"clangd",
		"omnisharp",
		"csharpier", -- format
		"gopls",
		-- devops
		"dockerfile-language-server",
		"docker-compose-language-service",
		"helm-ls",
		"yaml-language-server",
	},
}

-- lsp
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

M.mason_setup = function(_, opts)
	-- setup mason
	require("mason").setup(opts)
	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
	-- This will setup lsp for servers you listed above
	-- And servers you install through mason UI
	-- So defining servers in the list above is optional
	require("mason-lspconfig").setup_handlers({
		-- Default setup for all servers, unless a custom one is defined below
		function(server_name)
			lspconfig[server_name].setup({
				-- on_attach = function(client, bufnr)
				--   on_attach(client, bufnr)
				--   -- Add your other things here
				--   -- Example being format on save or something
				-- end,
				on_init = nv_on_init,
				on_attach = nv_on_attach,
				capabilities = nv_capabilities,
			})
		end,

		-- custome setting
		["tsserver"] = function()
			local function ts_organize_imports() end
			lspconfig.tsserver.setup({
				on_init = nv_on_init,
				on_attach = nv_on_attach,
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
						function()
							vim.lsp.buf.execute_command({
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(0) },
								title = "",
							})
						end,
						description = "Organize Imports",
					},
				},
			})
		end,

		["tailwindcss"] = function()
			lspconfig.tailwindcss.setup({
				on_init = nv_on_init,
				on_attach = nv_on_attach,
				capabilities = nv_capabilities,
				filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "svelte", "vue" },
			})
		end,

		["yamlls"] = function()
			lspconfig.yamlls.setup({
				on_init = nv_on_init,
				on_attach = nv_on_attach,
				capabilities = nv_capabilities,
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
			})
		end,

		["omnisharp"] = function()
			lspconfig.omnisharp.setup({
				on_init = nv_on_init,
				on_attach = nv_on_attach,
				capabilities = nv_capabilities,
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
					["textDocument/typeDefinition"] = require("omnisharp_extended").handler,
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
				enable_roslyn_analyzers = false,
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
			})
		end,
	})
end

return M
