local lsp_installer = require("nvim-lsp-installer")

local on_attach = function()
  nkeymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  nkeymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  nkeymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  nkeymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  nkeymap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  nkeymap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  nkeymap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  nkeymap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  nkeymap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  nkeymap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  nkeymap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  nkeymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  nkeymap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  nkeymap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  nkeymap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  nkeymap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  nkeymap("gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == 'sumneko_lua' then
      opts = {
        settings = {
          Lua = {
            runtime = {
              path = runtime_path,
            },
            diagnostics = {
              globals = {"vim"}
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          }
        }
      }
    end

    opts.on_attach = on_attach
    opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

    server:setup(opts)
end)
