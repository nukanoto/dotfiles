require("rc/lazy")

local plugins = {
  {
    "folke/tokyonight.nvim",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
}

require("lazy").setup(plugins)
