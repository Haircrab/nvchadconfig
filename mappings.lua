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
    ["<C-wv>"] = {
      "<C-c>:vsplit<cr>",
      "Split vertical",
      opts = {
        nowait = true,
      },
    },
    ["<C-wh>"] = {
      "<C-c>:split<cr>",
      "Split horizontal",
      opts = {
        nowait = true,
      },
    },
  },
}

M.tabuline = {
  n = {
    ["<A-t>"] = {
      "<C-c>:tabnew<cr>",
    },
    ["<A-w>"] = {
      "<C-c>:tabclose<cr>",
    },
    ["<A-]>"] = {
      "<C-c>:tabnext<cr>",
    },
    ["<A-[>"] = {
      "<C-c>:tabNext<cr>",
    },
    ["<A-1>"] = {
      "1gt",
    },
    ["<A-2>"] = {
      "2gt",
    },
    ["<A-3>"] = {
      "3gt",
    },
    ["<A-4>"] = {
      "4gt",
    },
    ["<A-5>"] = {
      "5gt",
    },
  },
  i = {
    ["<A-t>"] = {
      "<C-c>:tabnew<cr>",
    },
    ["<A-w>"] = {
      "<C-c>:tabclose<cr>",
    },
    ["<A-]>"] = {
      "<C-c>:tabnext<cr>",
    },
    ["<A-[>"] = {
      "<C-c>:tabNext<cr>",
    },
    ["<A-1>"] = {
      "1gt",
    },
    ["<A-2>"] = {
      "2gt",
    },
    ["<A-3>"] = {
      "3gt",
    },
    ["<A-4>"] = {
      "4gt",
    },
    ["<A-5>"] = {
      "5gt",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>u"] = { "<cmd>UndotreeToggle<cr>" },
  },
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        if vim.bo.filetype == "cs" then
          require("omnisharp_extended").telescope_lsp_definitions()
        else
          vim.lsp.buf.definition()
        end
        -- vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

}

M.trouble = {
  n = {
    ["<leader>tro"] = {
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

M.fuzzy = {
  n = {
    ["<leader>fzz"] = {
      "<C-c>:FzfLua<cr>",
      "Open fizzy",
    },
    ["<leader>fzf"] = {
      "<C-c>:FzfLua files<cr>",
      "Open fizzy files",
    },
    ["<leader>fzw"] = {
      "<C-c>:FzfLua live_grep<cr>",
      "Open fizzy live grep",
    },
    ["<leader>fzb"] = {
      "<C-c>:FzfLua buffers<cr>",
      "Open fizzy buffers",
    },
  }
}

return M
