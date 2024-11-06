return {
  --{
   -- "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
  --  opts = require "configs.conform",
 -- },
--  {
 --   "nvim-neotest/nvim-nio"
 -- },
 -- {
 --   "rcarriga/nvim-dap-ui",
 --   event = "VeryLazy",
 --   dependencies = "mfussenegger/nvim-dap",
  --  config = function ()
   --   local dap = require("dap")
    --  local dapui = require("dapui")
   --   require("dapui").setup()
    --  dap.listeners.after.event_initialized["dapui_config"] = function ()
     --   dapui.open()
    --  end
     -- dap.listeners.before.event_terminated["dapui_config"] = function ()
    --    dapui.close()
    --  end
    --  dap.listeners.before.event_exited["dapui_config"] = function ()
    --    dapui.close()
    --  end
   -- end
  --},
  --{
   -- "mfussenegger/nvim-dap",
   -- dependencies = "vscode-js-debug",
   -- config = function ()
   --   require "custom.configs.dap"
    --  require "custom.mappings"
   -- end
  --},
  --{
  --  "microsoft/vscode-js-debug",  -- The JS Debugger for VS Code
   -- lazy = true,
--    build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && Remove-Item -Recurse -Force out && Move-Item dist out"
  --},
 -- {
   -- "mxsdev/nvim-dap-vscode-js",
   -- config = function()
    --  require('dap-vscode-js').setup({
     --   debugger_path = "C:\\Users\\pedro\\AppData\\Local\\nvim-data\\lazy\\vscode-js-debug",
     --   adapters = { "pwa-chrome", "pwa-node" },  -- Use the Firefox adapter
      --   })
     -- require("custom.configs.dap")
   -- end,
  --},
  {
    "mhartington/formatter.nvim",
    event="VeryLazy",
    opts = function ()
      return require "custom.configs.formatter"
    end
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        -- Optional configurations if needed
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        git = {
          ignore = false,  -- Disable hiding of .gitignore files
        },
      })
    end,
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },







}
