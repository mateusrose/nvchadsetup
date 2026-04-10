-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config;
-- EXAMPLE
local servers = { "html", "cssls", "pyright", "jdtls", "tailwindcss", 'ts_ls', 'eslint' }
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig('ts_ls',
  {
    filetypes = {"javascript", "javascriptreact"}
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig('jsonls', {
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { ".git" },
})

vim.lsp.enable('jsonls')

lspconfig('pyright', {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      pythonPath = '/home/cms/.pyenv/versions/3.12.13/bin/python'
    }
  }
})
-- lsps with default config
 for _, lsp in ipairs(servers) do
   if lsp ~= "pyright" then
     lspconfig(lsp, {
       on_attach = nvlsp.on_attach,
       on_init = nvlsp.on_init,
     capabilities = nvlsp.capabilities,
     })
  end
end

vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('jdtls')
vim.lsp.enable('eslint')
-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
