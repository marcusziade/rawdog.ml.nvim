-- Load tracker plugins if available
local plugins = {}
local ok, tracker_plugins = pcall(require, 'tracker_plugins')
if ok then
  for _, plugin in ipairs(tracker_plugins) do
    table.insert(plugins, plugin)
  end
end

-- Core plugins list
local core_plugins = {
  -- Core plugins
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          telescope = true,
          mason = true,
          nvimtree = true,
          which_key = true,
          gitsigns = true,
          treesitter = true,
          cmp = true,
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
  { "nvim-lua/plenary.nvim", lazy = false },
  { "tpope/vim-surround" },
  { "numToStr/Comment.nvim", opts = {} },

  -- File navigation
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "gopls",
        "typescript-language-server",
        "pyright",
        "sourcekit-lsp",
      },
    },
  },

  -- Completions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "go", "typescript", "javascript", "python", "swift", "lua" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Git integration
  { "lewis6991/gitsigns.nvim", opts = {} },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<C-y>",
  --       },
  --     },
  --   },
  -- },
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
      { "<leader>fe", "<cmd>NvimTreeFocus<CR>", desc = "Focus file explorer" },
    },
    opts = {
      filters = {
          dotfiles = false,
      },
      disable_netrw = true,
      hijack_cursor = true,
      hijack_netrw = true,
    },
  },

  -- Which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  -- Web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
      }
    }
  },

  -- Wakatime
  { 'wakatime/vim-wakatime', lazy = false }
}

-- Merge core plugins
for _, plugin in ipairs(core_plugins) do
  table.insert(plugins, plugin)
end

return plugins
