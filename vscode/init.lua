local opt = vim.opt
local g = vim.g
local keymap = vim.keymap
local cmd = vim.cmd

opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true
opt.relativenumber = true
-- opt.clipboard = "unnamed"
opt.clipboard:append { "unnamed", "unnamedplus" }

vim.g.mapleader = " "

--  insert mode
-- begin of line
keymap.set("i", "<C-b>", "<ESC>^i")
-- end of line
keymap.set("i", "<C-e>", "<End>")

--  normal mode
if g.vscode then
  keymap.set("n", "zM", "<cmd>call VSCodeNotify('editor.foldAll')<CR>")
  keymap.set("n", "zR", "<cmd>call VSCodeNotify('editor.unfoldAll')<CR>")
  keymap.set("n", "zc", "<cmd>call VSCodeNotify('editor.fold')<CR>")
  keymap.set("n", "zC", "<cmd>call VSCodeNotify('editor.foldRecursively')<CR>")
  keymap.set("n", "zo", "<cmd>call VSCodeNotify('editor.unfold')<CR>")
  keymap.set("n", "zO", "<cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>")
  keymap.set("n", "za", "<cmd>call VSCodeNotify('editor.toggleFold')<CR>")

  keymap.set("n", "<leader>x", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
  keymap.set("n", "<leader>/", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
  keymap.set("v", "<leader>/", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>")

  keymap.set("n", "<leader>gt", function()
    cmd "call VSCodeNotify('workbench.scm.focus')"
    -- focus first chagne in git graph
    cmd "call VSCodeNotify('list.focusDown')"
  end)

  keymap.set("n", "<leader>gg", function()
    cmd "call VSCodeNotify('git-graph.view')"
  end)

  -- switch between windows
  keymap.set("n", "<leader>so", "<cmd>call VSCodeNotify('workbench.action.switchWindow')<CR>")

  -- switch between tabs
  keymap.set("n", "<Tab>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  keymap.set("n", "<S-Tab>", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
  -- zen
  keymap.set("n", "<leader>z", "<cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>")

  -- goToReferences
  keymap.set("n", "gr", "<cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
  keymap.set("n", "gD", "<cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")

  keymap.set("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
  keymap.set("n", "<leader>ra", "<cmd>call VSCodeNotify('editor.action.rename')<CR>")

  -- delete word
  keymap.set("i", "<C-W>", "<cmd>call VSCodeNotify('deleteWordLeft')<CR>")
end

keymap.set("n", ";", ":")

-- visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- plugins
return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use("ggandor/lightspeed.nvim", {
    lazy = false,
    jump_to_unique_chars = false,
    safe_labels = {},
  })

  use "max397574/better-escape.nvim"
  use "xiyaowong/fast-cursor-move.nvim"
end)
