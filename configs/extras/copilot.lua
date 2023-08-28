--- This will install copilot.lua and copilot
--- This should not be used in tandem with copilot-cmp module
--- The plugins are created by one of NvChad's member: zbirenbaum :D
--- For more information, read https://github.com/zbirenbaum/copilot.lua
--- Feel free to override the defaults of copilot.lua, using a spec, such as:
--- ```
--- {
---   "zbirenbaum/copilot.lua",
---   opts = function(_, opts --[[NvChad's default opts]])
---     -- Return the modified opts table
---   end,
--- }
--- ```

---@type NvPluginSpec
local spec = {
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   -- Mapping tab is already used by NvChad
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_tab_fallback = ""
  --     -- The mapping is set to other key, see custom/lua/mappings  -- or run <leader>ch to see copilot mapping section
  --   end,
  -- },
}

return spec
