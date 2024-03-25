local M = {}

M.cmp = function(_, opts)
	local cmp = require("cmp")
	opts = {
		sources = cmp.config.sources(vim.list_extend(opts.sources, {
			-- configs
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
	ensure_installed = {
		-- vim
		"vim",
		"lua",
		-- document
		"markdown",
		"markdown_inline",
		-- c family
		"c",
		"c_sharp",
		-- web
		"html",
		"css",
		"json",
		"json5",
		"jsonc",
		"tsx",
		"vue",
		"prisma",
		-- main languages
		"javascript",
		"typescript",
		"python",
		-- rust
		"ron",
		"rust",
		"toml",
		"go",
		"kotlin",
		"java",
		-- devops
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
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
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
