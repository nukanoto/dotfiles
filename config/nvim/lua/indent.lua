local function set_indent(tab_length)
  vim.bo.expandtab   = true

  vim.bo.shiftwidth  = tab_length
  vim.bo.softtabstop = tab_length
  vim.bo.tabstop     = tab_length
end

set_indent(4)

vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.js,*.jsx,*.ts,*.tsx,*.lua",
    callback = function()
      set_indent(2)
    end
  }
)
