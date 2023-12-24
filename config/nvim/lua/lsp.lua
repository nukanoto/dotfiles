require("util")

return function()
  -- set up completion
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local ls_opts = {
    capabilities = capabilities
  }

  -- Setup language servers.
  require('mason').setup()
  require('null-ls').setup()
  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers({
    function(server_name)
      require('lspconfig')[server_name].setup(ls_opts)
    end,
  })

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ga', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gf', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
  -- nkeymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  -- NKeymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- NKeymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- NKeymap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  -- NKeymap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- NKeymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- NKeymap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  -- NKeymap("gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end
