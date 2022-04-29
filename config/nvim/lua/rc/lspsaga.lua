local M = {}

require('lspsaga').setup({})

M.on_attach = function()
  nkeymap("K", "<cmd>Lspsaga hover_doc<CR>")
  nkeymap("<space>rn", "<cmd>Lspsaga rename<CR>")
  nkeymap("gq", "<cmd>Lspsaga code_action<CR>")
  nkeymap("gD", "<cmd>Lspsaga show_line_diagnostics<CR>")
  nkeymap("gD", "<cmd>Lspsaga show_line_diagnostics<CR>")
  nkeymap("gn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  nkeymap("gN", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  nkeymap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
  nkeymap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
end

return M
