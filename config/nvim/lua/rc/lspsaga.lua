require("util")

return function()
	require("lspsaga").setup({})

	NKeymap("K", "<cmd>Lspsaga hover_doc<CR>")
	NKeymap("<space>rn", "<cmd>Lspsaga rename<CR>")
	NKeymap("gq", "<cmd>Lspsaga code_action<CR>")
	NKeymap("gD", "<cmd>Lspsaga show_line_diagnostics<CR>")
	NKeymap("gD", "<cmd>Lspsaga show_line_diagnostics<CR>")
	NKeymap("gn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	NKeymap("gN", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	NKeymap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
	NKeymap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
end
