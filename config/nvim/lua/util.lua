function Keymap(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts or { noremap = true, silent = true })
end

function NKeymap(from, to, opts)
  Keymap('n', from, to, opts)
end

function IKeymap(from, to, opts)
  Keymap('i', from, to, opts)
end

function TKeymap(from, to, opts)
  Keymap('t', from, to, opts)
end

