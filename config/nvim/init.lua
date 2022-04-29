require 'global'
require 'early-settings'
require 'plugins'
require 'rc/lsp'
require 'rc/lspsaga'
require 'rc/trouble'
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
nkeymap('O', 'o<Esc>')
nkeymap('<Leader>hr', ':%!xxd<Cr> :set filetype=xxd<Cr>') -- Hex read
nkeymap('<Leader>hw', ':%!xxd -r<Cr> :set binary<Cr> :set filetype=<Cr>') -- Hex write
nkeymap('<Leader>w', 'zf')
nkeymap('<Leader>q', 'zd')
nkeymap('<Leader>h', '<Cmd>noh<Cr>')
nkeymap('<C-h>', '<C-w>h')
nkeymap('<C-j>', '<C-w>j')
nkeymap('<C-k>', '<C-w>k')
nkeymap('<C-l>', '<C-w>l')
nkeymap('<A-h>', '<C-w>>')
nkeymap('<A-j>', '<C-w>+')
nkeymap('<A-k>', '<C-w>-')
nkeymap('<A-l>', '<C-w><')
nkeymap('<Leader>j', '<Cmd>sp<Cr>')
nkeymap('<Leader>l', '<Cmd>vs<Cr>')
nkeymap('<Leader>x', '<Cmd>bd<Cr>')
tkeymap('<C-[>', '<C-\\><C-n>')

vim.cmd[[set shiftwidth=2
set expandtab]]
