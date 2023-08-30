---@type MappingsTable
--
local M = {}

M.disabled = {
  n = {
    -- disable toggle nvimtree as it conflict with visual multi select
    ["<C-n>"] = "",
  },
}

M.general = {
  n = {
    [";"] = {
      ":",
      "Enter command mode",
      opts = {
        nowait = true,
      },
    },
  },
  i = {
    ["<C-leader>"] = {
      function()
        require("cmp").complete()
      end,
      "Trigger completion",
      opts = {
        nowait = true,
      },
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gg"] = {
      "<C-c>:Flog<cr>",
      "Open git graph",
      opts = {
        nowait = true,
      },
    },
    ["<leader>gd"] = {
      "<cmd>Gitsigns diffthis HEAD~1<cr>",
      "Open git diff",
      opts = {
        nowait = true,
      },
    },
    ["<leader>u"] = {
      "<cmd>UndotreeToggle<cr>",
    },
  },
}

M.lspconfig = {
  n = {
    ["gd"] = {
      "<cmd>Telescope lsp_definitions<cr>",
      "Go to definition file",
      opts = {
        nowait = true,
      },
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tx"] = {
      function()
        require("trouble").open()
      end,
      "Open trouble",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tw"] = {
      function()
        require("trouble").open "workspace_diagnostics"
      end,
      "Trouble workspace diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>td"] = {
      function()
        require("trouble").open "document_diagnostics"
      end,
      "Trouble document diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tq"] = {
      function()
        require("trouble").open "quickfix"
      end,
      "Trouble quickfix",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tl"] = {
      function()
        require("trouble").open "loclist"
      end,
      "Trouble loclist",
      opts = {
        nowait = true,
      },
    },
  },
}

M.symbols_outline = {
  n = {
    ["<leader>cs"] = {
      function()
        local symbols = require "symbols-outline"
        symbols.open_outline()
        vim.fn.win_gotoid(symbols.view.winnr)
      end,
      "Toggle or focus symbols outline",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.zen_mode = {
  n = {
    ["<leader>z"] = {
      function()
        require("zen-mode").toggle {
          -- window = {
          --   width = 0.85, -- width will be 85% of the editor width
          -- },
        }
      end,
      "Toggle zen mode",
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon",
    },
    ["<C-e>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon menu",
    },
    ["<C-1>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Go to harpoon mark 1",
    },
    ["<C-2>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Go to harpoon mark 2",
    },
    ["<C-3>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Go to harpoon mark 3",
    },
    ["<C-4>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Go to harpoon mark 4",
    },
  },
}
-- M.telescope = {
--   plugin = true,
--
--   n = {
--     -- find
--     ["<leader>fwp"] = { "<C-c>:Telescope live_grep glob_pattern=*.{}<cr>", "Live grep with file type filter" },
--     ["<leader>fwd"] = { "<C-c>:Telescope live_grep search_dirs=*.{}<cr>", "Live grep with directory filter" },
--   },
-- }

return M
