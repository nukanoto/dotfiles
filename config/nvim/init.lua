require("keymaps")
require("plugins")
require("indent")

vim.g.python3_host_prog = '/usr/bin/python'
vim.g.auto_save = 1
vim.o.completeopt = 'menu,menuone,noselect'
vim.wo.signcolumn = "yes"

vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('smartindent', true)
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_win_set_option(0, 'listchars', 'tab:»-,trail:-,extends:»,nbsp:%')
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
