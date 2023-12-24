require("util")

vim.g.mapleader = " "

IKeymap('jj', '<Esc>')
NKeymap('O', 'o<Esc>')
NKeymap('<Leader>hr', ':%!xxd<Cr> :set filetype=xxd<Cr>') -- Hex read
NKeymap('<Leader>hw', ':%!xxd -r<Cr> :set binary<Cr> :set filetype=<Cr>') -- Hex write
NKeymap('<Leader>w', 'zf')
NKeymap('<Leader>q', 'zd')
NKeymap('<Leader>h', '<Cmd>noh<Cr>')
NKeymap('<C-h>', '<C-w>h')
NKeymap('<C-j>', '<C-w>j')
NKeymap('<C-k>', '<C-w>k')
NKeymap('<C-l>', '<C-w>l')
NKeymap('<A-h>', '<C-w>>')
NKeymap('<A-j>', '<C-w>+')
NKeymap('<A-k>', '<C-w>-')
NKeymap('<A-l>', '<C-w><')
NKeymap('<Leader>j', '<Cmd>sp<Cr>')
NKeymap('<Leader>l', '<Cmd>vs<Cr>')
NKeymap('<Leader>x', '<Cmd>bd<Cr>')
TKeymap('<C-[>', '<C-\\><C-n>')

