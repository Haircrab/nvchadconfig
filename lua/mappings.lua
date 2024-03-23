require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

-- disable toggle nvimtree as it conflict with visual multi select
nomap("n", "<C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- gitsigns
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- trouble
map("n", "<leader>tro", function()
  require("trouble").open()
end, { desc = "Open trouble" })

map("n", "<leader>trw", function()
  require("trouble").open "workspace_diagnostics"
end, { desc = "Trouble workspace diagnostic" })

map("n", "<leader>trd", function()
  require("trouble").open "document_diagnostics"
end, { desc = "Trouble document diagnostic" })

map("n", "<leader>trf", function()
  require("trouble").open "quickfix"
end, { desc = "Trouble quickfix" })

-- symbols_outline
map("n", "<leader>cs", function()
  local symbols = require "symbols-outline"
  symbols.open_outline()
  vim.fn.win_gotoid(symbols.view.winnr)
end, { desc = "Toggle or focus symbols outline" })

-- nvimtree
map("n", "<C-b>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>cat", "<cmd> NvimTreeCollapse <CR>", { desc = "Collapse nvimtree" })

-- zen_mode
map("n", "<leader>z", "<C-c>:ZenMode<cr>", { desc = "Toggle zen mode" })

-- harpoon
map("n", "<leader>a", function()
  require("harpoon.mark").add_file()
end, { desc = "Add file to harpoon" })

map("n", "<C-g>", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle harpoon menu" })

-- fuzzy
map("n", "<leader>fzz", "<C-c>:FzfLua<cr>", { desc = "Open fizzy" })
map("n", "<leader>fzf", "<C-c>:FzfLua files<cr>", { desc = "Open fizzy files" })
map("n", "<leader>fzw", "<C-c>:FzfLua live_grep<cr>", { desc = "Open fizzy live grep" })
map("n", "<leader>fzb", "<C-c>:FzfLua buffers<cr>", { desc = "Open fizzy buffers" })

-- lsp
local function opts(desc)
  return { buffer = bufnr, desc = desc }
end

map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
map("n", "gd", vim.lsp.buf.definition, opts "Lsp Go to definition")
map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
map("n", "gi", vim.lsp.buf.implementation, opts "Lsp Go to implementation")
map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts "Lsp List workspace folders")

map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")

map("n", "<leader>ra", function()
  require "nvchad.lsp.renamer"()
end, opts "Lsp NvRenamer")

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Lsp Code action")
map("n", "gr", vim.lsp.buf.references, opts "Lsp Show references")
