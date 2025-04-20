return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    opts = function()
      local nvlsp     = require("nvchad.configs.lspconfig")
      -- grab global npm root so tsserver can find the plugin
      local npm_root  = vim.fn.trim(vim.fn.system("npm root -g"))

      return {
        -- your usual NVChad LSP hooks:
        on_attach    = nvlsp.on_attach,
        on_init      = nvlsp.on_init,
        capabilities = nvlsp.capabilities,

        -- only for TS/TSX:
        filetypes = { "typescript", "typescriptreact" },

        -- tell tsserver where to probe for plugins:
        init_options = {
          pluginProbeLocations = { npm_root },
        },

        -- typescript-tools settings:
        settings = {
          -- whichever you installed globally:
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
            -- or "@styled/typescript-styled-plugin",
          },
          -- only run diagnostics on save
          publish_diagnostic_on = "save",
          -- slim code-lens to implementations only
          code_lens = "all",
          -- (uncomment if desired)
          -- complete_function_calls = true,
          -- separate_diagnostic_server = true,
        },
      }
    end,
  },
}
