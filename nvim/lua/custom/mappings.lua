---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>b"] = ""
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>zz"] = { "<cmd> set buftype= <CR>", "fix save issue" },
    ["<leader>q"] = { "<cmd> qa! <CR>", "save and quit all" },
    ["<leader>sh"] = { "<cmd> nohl <CR>", "stop search highlighting" }
  },
}

M.git = {
  n = {
    ["<leader>lg"] = { "<cmd> LazyGit <CR>", "open lazygit" }
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-t>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.spectre = {
  -- plugin = true,

  n = {
    ["<leader>sr"] = { "<cmd> lua require('spectre').open() <CR>", "search and replace"}
  }
}

M.trouble = {
  n = {
    ["<leader>tc"] = { "<cmd> TodoTrouble <CR>", "open trouble panel" },
    ["<leader>fc"] = { "<cmd> TodoTelescope <CR>", "find comments" }
  }
}

M.sidebar = {
  n = {
    ["<leader>sb"] = { "<cmd> lua require('sidebar-nvim').toggle() <CR>", "open sidebar" }
  }
}

M.folding = {
  n = {
    ["zR"] = { "<cmd> lua require('ufo').openAllFolds() <CR>", "open all folds" },
    ["zM"] = { "<cmd> lua require('ufo').closeAllFolds() <CR>", "close all folds" },
    ["zr"] = { "<cmd> lua require('ufo').openFoldsExceptKinds() <CR>", "open folds" },
    ["zm"] = { "<cmd> lua require('ufo').closeFoldsWith() <CR>", "close folds" }
  }
}

M.bookmarks = {
  n = {
    ["<leader>bl"] = { "<cmd> lua require('bookmarks').toggle_bookmarks() <CR>", "toggle bookmarks list" },
    ["<leader>bs"] = { "<cmd> lua require('bookmarks').add_bookmarks() <CR>", "set a bookmark" },
  }
}

M.neogen = {
  n = {
    ["<leader>ng"] = { "<cmd> Neogen <CR>", "add doc comment" }
  }
}

M.searchbox = {
  n = {
    ["<leader>ss"] = { "<cmd> SearchBoxMatchAll <CR>", "search in file" },
    ["<leader>sx"] = { "<cmd> SearchBoxReplace <CR>", "simple search and replace in file" },
  }
}

M.easyalign = {
  v = {
    ["ga"] = { "<Plug>(EasyAlign)", "align in visual mode" },
  },
  n = {
    ["ga"] = { "<Plug>(EasyAlign)", "align in normal mode" }
  }
}

-- M.neoscroll = {
--   n = {
--     ["<ScrollWheelUp>"] = { "<C-y>" },
--     ["<ScrollWheelDown>"] = {"<C-e>"},
--   },
--   i = {
--     ["<ScrollWheelUp>"] = { "<C-y>" },
--     ["<ScrollWheelDown>"] = {"<C-e>"},
--   },
--   v = {
--     ["<ScrollWheelUp>"] = { "<C-y>" },
--     ["<ScrollWheelDown>"] = {"<C-e>"},
--   },
-- }

-- more keybinds!

return M
