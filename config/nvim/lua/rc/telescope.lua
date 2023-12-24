require("util")

return function()
  require("telescope").setup {}

  NKeymap('<Leader>g', '<Cmd>Telescope find_files<Cr>')
  NKeymap('<Leader>f', '<Cmd>Telescope git_files<Cr>')
  NKeymap('<Leader>r', '<Cmd>Telescope current_buffer_fuzzy_find<Cr>')
  NKeymap('<Leader>i', '<Cmd>Telescope registers<Cr>')
  -- nkeymap('<Leader>o', '<Cmd>Telescope coc diagnostics<Cr>')
  NKeymap('<Leader>e', '<Cmd>Telescope treesitter<Cr>')
  NKeymap('<Leader>b', '<Cmd>Telescope buffers<Cr>')
  NKeymap('<Leader>s', '<Cmd>Telescope spell_suggest<Cr>')
end
