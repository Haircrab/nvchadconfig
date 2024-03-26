---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "palenight-custom"
};

M.ui.hl_override = {
  ["@variable"] = { fg = "#c7d1ff" },

  ["@keyword"] = { fg = "#89ddff" },
  Repeat = { fg = "#89ddff" },
  Operator = { fg = "#89ddff" },
  ["@operator"] = { fg = "#89ddff" },
  ["@punctuation.bracket"] = { fg = "#89ddff" },

  ["@type.builtin"] = { fg = "#c792ea" },
  Typedef = { fg = "#ffcb6b" },
  Type = { fg = "#ffcb6b" },
  Structure = { fg = "#ffcb6b" },

  Comment = {
    italic = true,
  },
}


-- local success, themeModule = pcall(require, 'themes.' .. M.ui.theme)
-- if success then
--   M.ui.hl_override = themeModule.polish_hl
-- end


return M
