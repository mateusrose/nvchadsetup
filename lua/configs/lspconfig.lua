-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config;
-- EXAMPLE
local servers = { "html", "cssls", "pyright", "jdtls", "tailwindcss"}
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig('ts_ls',
  {
    filetypes = {"javascript", "javascriptreact"}
  }
)

lspconfig('jsonls', {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})

lspconfig('pyright', {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      pythonPath = '/home/mateusrosa/.pyenv/versions/3.8.20/bin/python'
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

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
