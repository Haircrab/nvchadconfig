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

if vim.g.vscode then
  M.fold = {
    n = {
      ["zM"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.foldAll')"
          else
            require("ufo").closeAllFolds()
          end
        end,
        "Close all folds",
      },
      ["zR"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.unfoldAll')"
          else
            require("ufo").openAllFolds()
          end
        end,
        "Open all folds",
      },
      ["zc"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.fold')"
          end
        end,
        "Fold",
      },
      ["zC"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.foldRecursively')"
          end
        end,
        "Fold recursively",
      },
      ["zo"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.unfold')"
          end
        end,
        "Unfold",
      },
      ["zO"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.unfoldRecursively')"
          end
        end,
        "Unfold recursively",
      },
      ["za"] = {
        function()
          if vim.g.vscode then
            vim.cmd "call VSCodeNotify('editor.toggleFold')"
          end
        end,
        "Toggle fold",
      },
    },
  }
end

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
    ["<C-g>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Toggle harpoon menu",
    },
    -- ["<C-h>"] = {
    --   function()
    --     require("harpoon.ui").nav_file(1)
    --   end,
    --   "Go to harpoon mark 1",
    -- },
    -- ["<C-j>"] = {
    --   function()
    --     require("harpoon.ui").nav_file(2)
    --   end,
    --   "Go to harpoon mark 2",
    -- },
    -- ["<C-k>"] = {
    --   function()
    --     require("harpoon.ui").nav_file(3)
    --   end,
    --   "Go to harpoon mark 3",
    -- },
    -- ["<C-l>"] = {
    --   function()
    --     require("harpoon.ui").nav_file(4)
    --   end,
    --   "Go to harpoon mark 4",
    -- },
  },
}

return M
