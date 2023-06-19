local g = vim.g
local opt = vim.opt

-- Folding
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- g.terminal_color_0  = "#3b4252"
-- g.terminal_color_1  = "#bf616a"
-- g.terminal_color_2  = "#a3be8c"
-- g.terminal_color_3  = "#ebcb8b"
-- g.terminal_color_4  = "#81a1c1"
-- g.terminal_color_5  = "#b48ead"
-- g.terminal_color_6  = "#88c0d0"
-- g.terminal_color_7  = "#e5e9f0"
-- g.terminal_color_8  = "#4c566a"
-- g.terminal_color_9  = "#bf616a"
-- g.terminal_color_10 = "#a3be8c"
-- g.terminal_color_11 = "#ebcb8b"
-- g.terminal_color_12 = "#81a1c1"
-- g.terminal_color_13 = "#b48ead"
-- g.terminal_color_14 = "#8fbcbb"
-- g.terminal_color_15 = "#eceff4"

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "oceanic-next",
  theme_toggle = { "oceanic-next", "one_light" },

  statusline = {
    theme = "minimal",
    separator_style = "round"
  },

  cmp = {
    style = "default",
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
