---@type MappingsTable
--
local M = {}

M.general = {
  n = {
    [";"] = {
      ":",
      "enter command mode",
      opts = {
        nowait = true,
      },
    },
    ["gd"] = {
      "<cmd>Telescope lsp_definitions<cr>",
      "go to definition file",
      opts = {
        nowait = true,
      },
    },
  },
}

-- Extras example

M.trouble = {
  n = {
    ["<leader>tx"] = {
      function()
        require("trouble").open()
      end,
      "open trouble",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tw"] = {
      function()
        require("trouble").open "workspace_diagnostics"
      end,
      "trouble workspace diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>td"] = {
      function()
        require("trouble").open "document_diagnostics"
      end,
      "trouble document diagnostic",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tq"] = {
      function()
        require("trouble").open "quickfix"
      end,
      "trouble quickfix",
      opts = {
        nowait = true,
      },
    },
    ["<leader>tl"] = {
      function()
        require("trouble").open "loclist"
      end,
      "trouble loclist",
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
      "toggle or focus symbols outline",
    },
  },
}

-- more keybinds!

return M
