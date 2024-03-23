---@type ChadrcConfig

local palenight = require "themes.palenight"
local M = {}

M.ui = {
  changed_themes = {
    palenight = {
      base_16 = palenight.base_16,
      base_30 = palenight.base_30,
    },
  },
  theme = "palenight",
}

if M.ui.theme == "palenight" then
  M.ui.hl_override = {
    ["@variable"] = { fg = palenight.base_30.lavender },

    ["@keyword"] = { fg = palenight.base_30.cyan },
    Repeat = { fg = palenight.base_30.cyan },
    Operator = { fg = palenight.base_30.cyan },
    ["@operator"] = { fg = palenight.base_30.cyan },

    ["@property"] = { fg = palenight.base_16.base04 },
    ["@type.builtin"] = { fg = palenight.base_30.purple },
    Typedef = { fg = palenight.base_30.yellow },
    Type = { fg = palenight.base_30.yellow },
    Structure = { fg = palenight.base_30.yellow },

    ["@punctuation.bracket"] = { fg = palenight.base_30.cyan },
    -- ["@parenthesis"] = { fg = palenight.base_30.dark_purple },

    Comment = {
      italic = true,
    },
  }
end

return M
