-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "bearded-arc",
	hl_override = {
    CustomSymbols = { fg = "#77DD77"}
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	 },
}

return M
