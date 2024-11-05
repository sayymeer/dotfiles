-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@class ChadrcConfig
local M = {}

M.ui = {
  theme = "oxocarbon",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.plugins = {
  override = {
    -- ["kyazdani42/nvim-tree.lua"] = require "configs.nvtree",
  },
  -- user = {
  --   ["kyazdani42/nvim-tree.lua"] = {
  --     lazy = false, -- this will disable lazy loading for nvim-tree
  --   },
  -- },
}

return M
