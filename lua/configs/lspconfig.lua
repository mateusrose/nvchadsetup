-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "jdtls", "ts_ls", "tailwindcss"}
local nvlsp = require "nvchad.configs.lspconfig"

require("lspconfig").ts_ls.setup (
  {
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"}
  }
)

lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      pythonPath = '/home/mateusrosa/.pyenv/versions/3.12.3/bin/python'
    }
  }
})
-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp ~= "pyright" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
