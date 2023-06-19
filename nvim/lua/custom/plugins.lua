local overrides = require("custom.configs.overrides")

local ufoHandler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = true
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },

  {
    "folke/trouble.nvim",
    opts = {}
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--glob=!node_modules"
        }
      }
    }
  },

  {
    "windwp/nvim-spectre",
    lazy = false,
    config = true
  },

  {
    "nvim-neorg/neorg",
    ft = {"norg", "neorg"},
    opts = {
      load = {
        ["core.defaults"] = {}
      }
    }
  },

  {
    "leafo/moonscript-vim",
    ft = {"moon", "moonscript"}
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function() require("leap").add_default_mappings() end
  },

  {
    "folke/lsp-colors.nvim"
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {
      input = {
        enabled = true
      },
      select = {
        enabled = true
      }
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function() vim.g.mkdp_filetypes = {"markdown"} end,
    ft = {"markdown"}
  },

  {
    "utilyre/barbecue.nvim",
    lazy = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic"
    },
    opts = {}
  },

  {
    "uga-rosa/ccc.nvim"
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        mappings = {"<C-y>", "<C-e>"},
      }
      require("neoscroll.config").set_mappings {
        ["<ScrollWheelUp>"] = {"scroll", {"-0.15", "false", "100"}},
        ["<ScrollWheelDown>"] = {"scroll", {"0.15", "false", "100"}},
      }
    end,
    lazy = false,
  },

  {
    "jubnzv/virtual-types.nvim"
  },

  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function() require("marks").setup {
      default_mappings = true
    } end
  },

  {
    "sidebar-nvim/sidebar.nvim",
    config = function() require("sidebar-nvim").setup {
      disable_default_keybindings = 1,
      open = false,
      sections = {
        "git",
        "todos",
        "symbols",
        "diagnostics",
        "files",
      }
    } end
  },

  {
    "pigpigyyy/Yuescript-vim",
    ft = {"yue"}
  },

  {
    "kevinhwang91/nvim-ufo",
    ft = {"*"},
    dependencies = {
      "kevinhwang91/promise-async"
    },
    config = function() require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return {"treesitter", "indent"}
      end,
      -- fold_virt_text_handler = ufoHandler()
    } end
  },

  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup {
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }
        }
      }
    end
  },

  {
    "bennypowers/nvim-regexplainer",
    config = function() require'regexplainer'.setup() end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'MunifTanjim/nui.nvim',
    }
  },

  -- {
  --   "crusj/bookmarks.nvim",
  --   config = function() require("bookmarks").setup {
  --       keymap = {
  --         -- toggle = "<tab><tab>", -- Toggle bookmarks
  --         -- add = "\\z", -- Add bookmarks
  --         jump = "<CR>", -- Jump from bookmarks
  --         delete = "dd", -- Delete bookmarks
  --         order = "<space><space>", -- Order bookmarks by frequency or updated_time
  --         delete_on_virt = "\\dd", -- Delete bookmark at virt text line
  --         show_desc = "\\sd", -- show bookmark desc
  --       }
  --     }
  --     require("telescope").load_extension("bookmarks");
  --   end,
  -- },

  {
    "danymat/neogen",
    config = function() require("neogen").setup() end
  },

  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    lazy = false
  },

  {
    "dense-analysis/ale",
    lazy = false,
  },

  {
    "haringsrob/nvim_context_vt",
    lazy = false,
  },

  {
    "junegunn/vim-easy-align",
    lazy = false,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "olimorris/persisted.nvim",
    lazy = false,
    config = true,
    opts = { autoload = true },
  }
}

return plugins
