local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true
opt.relativenumber = true
-- opt.clipboard = "unnamed"
opt.clipboard:append { "unnamed", "unnamedplus" }

vim.g.mapleader = " "
local map = vim.ketmap.set

--  insert mode
-- begin of line
map("i", "<C-b>", "<ESC>^i")
-- end of line
map("i", "<C-e>", "<End>")

--  normal mode
if g.vscode then
  local vscode = require('vscode-neovim')
  local function mapMove(mode, key, direction)
    map(mode, key, function()
      local count = vim.v.count
      local v = 1
      local style = 'wrappedLine'
      if count > 0 then
        v = count
        style = 'line'
      end
      vscode.action('cursorMove', {
        args = {
          to = direction,
          by = style,
          value = v
        }
      })
    end, options)
  end
  mapMove('n', 'k', 'up')
  mapMove('n', 'j', 'down')
  mapMove('v', 'k', 'up')
  mapMove('v', 'j', 'down')
  map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
  map("i", "<C-e>", "<End>", { desc = "Move End of line" })
  map("i", "<C-h>", "<Left>", { desc = "Move Left" })
  map("i", "<C-l>", "<Right>", { desc = "Move Right" })
  map("i", "<C-j>", "<Down>", { desc = "Move Down" })
  map("i", "<C-k>", "<Up>", { desc = "Move Up" })

  map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

  map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
  map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
  map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
  map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })

  map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
  map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" })

  map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle Line number" })
  map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle Relative number" })

  -- lsp
  map("n", "zM", "<cmd>call VSCodeNotify('editor.foldAll')<CR>")
  map("n", "zR", "<cmd>call VSCodeNotify('editor.unfoldAll')<CR>")
  map("n", "zc", "<cmd>call VSCodeNotify('editor.fold')<CR>")
  map("n", "zC", "<cmd>call VSCodeNotify('editor.foldRecursively')<CR>")
  map("n", "zo", "<cmd>call VSCodeNotify('editor.unfold')<CR>")
  map("n", "zO", "<cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>")
  map("n", "za", "<cmd>call VSCodeNotify('editor.toggleFold')<CR>")

  map("n", "<leader>x", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
  map("n", "<leader>/", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
  map("v", "<leader>/", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>")

  map("n", "<leader>gt", function()
    cmd "call VSCodeNotify('workbench.scm.focus')"
    -- focus first chagne in git graph
    cmd "call VSCodeNotify('list.focusDown')"
  end)

  map("n", "<leader>gg", function()
    cmd "call VSCodeNotify('git-graph.view')"
  end)

  -- switch between windows
  map("n", "<leader>so", "<cmd>call VSCodeNotify('workbench.action.switchWindow')<CR>")

  -- switch between tabs
  map("n", "<Tab>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  map("n", "<S-Tab>", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
  -- zen
  map("n", "<leader>z", "<cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>")

  -- goToReferences
  map("n", "gr", "<cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
  map("n", "gD", "<cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")

  map("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
  map("n", "<leader>ra", "<cmd>call VSCodeNotify('editor.action.rename')<CR>")

  -- delete word
  map("i", "<C-W>", "<cmd>call VSCodeNotify('deleteWordLeft')<CR>")
end

map("n", ";", ":")

-- visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- plugins
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


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
