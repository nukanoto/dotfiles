local nvim_lsp = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local rc_lspsaga = require("rc/lspsaga")

local disable_formatting = function (client)
  client.resolved_capabilities.document_formatting = false
end

local on_attach = function()
  -- nkeymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  nkeymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  nkeymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  nkeymap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  nkeymap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  nkeymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  nkeymap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  nkeymap("gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  rc_lspsaga.on_attach()
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
      settings = {
        deno = {
          enable = true,
          lint = true,
          unstable = true,
        },
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

    if server.name == 'sumneko_lua' then
      opts.on_attach = function (client)
        disable_formatting(client)
        on_attach()
      end

      server:setup(opts)
    elseif server.name == 'rust_analyzer' then
      require('rust-tools').setup({
        server = vim.tbl_deep_extend("force", server:get_default_options(), { on_attach = on_attach, standalone = true }),
        tools = {
          server = {
            standalone = true,
          }
        }
      })

      server:attach_buffers()
    elseif server.name == "tsserver" or server.name == "eslint" then
      opts.root_dir = nvim_lsp.util.root_pattern("package.json")

      server:setup(opts)
    elseif server.name == "denols" then
      opts.root_dir = nvim_lsp.util.root_pattern("deno.json")

      server:setup(opts)
    else
      server:setup(opts)
    end
end)

require 'rc/null-ls'
