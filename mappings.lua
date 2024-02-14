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
    ["<leader>wv"] = {
      "<C-c>:vsplit<cr>",
      "Split vertical",
      opts = {
        nowait = true,
      },
    },
    ["<leader>ws"] = {
      "<C-c>:split<cr>",
      "Split horizontal",
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

M.twilight = {
  n = {
    ["<leader>ttl"] = {
      "<C-c>:Twilight<cr>",
      "Toggle twilight",
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
    ["<leader>u"] = { "<cmd>UndotreeToggle<cr>" },
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
    ["<leader>tr"] = {
      function()
        require("trouble").open()
      end,
      "Open trouble",
      opts = {
        nowait = true,
      },
    },
    ["<leader>trw"] = {
      function()
        require("trouble").open "workspace_diagnostics"
      end,
      "Trouble workspace diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>trd"] = {
      function()
        require("trouble").open "document_diagnostics"
      end,
      "Trouble document diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>trf"] = {
      function()
        require("trouble").open "quickfix"
      end,
      "Trouble quickfix",
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
        require("zen-mode").toggle()
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
    ["<C-g>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon menu",
    },
  },
}

return M
