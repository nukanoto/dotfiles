require 'global'
require 'early-settings'
require 'plugins'
require 'rc/lsp'
require 'rc/telescope'
require 'rc/hop'
require 'rc/cmp'
require 'rc/statusline'
require 'rc/treesitter'

vim.cmd([[
colorscheme tokyonight
syntax on

highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight clear SignColumn

autocmd BufNewFile,BufRead *.jl set filetype=julia
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
]])

vim.g.python3_host_prog = '/usr/bin/python'
vim.g.auto_save = 1
vim.o.completeopt = 'menu,menuone,noselect'

vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('smartindent', true)
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_win_set_option(0, 'listchars', 'tab:»-,trail:-,extends:»,nbsp:%')
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

ikeymap('jj', '<Esc>')
nkeymap('O', ':<C-u>call append(expand("."))<Cr>j', { noremap = true, silent = true })
nkeymap('<Leader>hr', ':%!xxd<Cr> :set filetype=xxd<Cr>') -- Hex read
nkeymap('<Leader>hw', ':%!xxd -r<Cr> :set binary<Cr> :set filetype=<Cr>') -- Hex write
nkeymap('<Leader>w', 'zf')
nkeymap('<Leader>q', 'zd')
nkeymap('<Leader>h', ':<C-u>noh<Cr>')

vim.cmd[[set shiftwidth=2
set expandtab]]
