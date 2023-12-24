require("rc/lazy")

local plugins = {
  -- style
  {
    "folke/tokyonight.nvim",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require("rc/treesitter")
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      { "nvim-tree/nvim-web-devicons" }
    },
  },

  -- other
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    'smoka7/hop.nvim',
    config = require("rc/hop"),
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = require("rc/surround"),
  },
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require("rc/telescope"),
  },


  -- lsp
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "nvimtools/none-ls.nvim",
    },
    config = require("lsp")
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "vim-test/vim-test"
    }
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = require("rc/lspsaga"),
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    }
  },


  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    event = "VeryLazy",
    config = require("completion")
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp", -- install jsregexp (optional!).
    config = require("rc/luasnip")
  }
}

require("lazy").setup(plugins)
