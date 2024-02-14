vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.g.vscode_snippets_path = "~/Library/Application Support/Code/User/snippets"

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
    theme = "palenight-custom",
    -- theme_toggle = { "onedark", "one_light" },

    hl_override = highlights.override,
    hl_add = highlights.add,

    lsp_semantic_tokens = true -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
    -- transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
