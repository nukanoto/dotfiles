--@type Global
_G = _G

---@class Global

function keymap(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts or { noremap = true, silent = true })
end

function nkeymap(from, to, opts)
  keymap('n', from, to, opts)
end

function ikeymap(from, to, opts)
  keymap('i', from, to, opts)
end

function tkeymap(from, to, opts)
  keymap('t', from, to, opts)
end
