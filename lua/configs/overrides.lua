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
    use_languagetree = false,
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = false,
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

-- telescope
M.telescope = {
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  file_ignore_patterns = { "node_modules" }
}

-- git signs
M.gitsigns = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set

    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map("n", "<leader>ghs", gs.reset_hunk, opts "Stage Hunk")
    map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts "Stage Hunk")

    map("n", "<leader>ghr", gs.reset_hunk, opts "Reset Hunk")
    map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts "Reset Hunk")

    map('n', '<leader>ghu', gs.undo_stage_hunk, opts "undo_stage_hunk")

    map("n", "<leader>ghp", gs.preview_hunk, opts "Preview Hunk")
    map('n', '<leader>tb', gs.toggle_current_line_blame, opts "toggle line blame")
  end,
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
