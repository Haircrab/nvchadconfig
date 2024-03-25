---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "palenight-custom",
}

local success, themeModule = pcall(require, 'themes.' .. M.ui.theme)
if success then
  M.ui.hl_override = themeModule.polish_hl
end


return M
