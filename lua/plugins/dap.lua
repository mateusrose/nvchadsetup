return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ==============================
      -- Mason Setup (installs js-debug)
      -- ==============================
      require("mason").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = { "js-debug-adapter" },
        automatic_installation = true,
      })

      -- ==============================
      -- DAP UI Setup
      -- ==============================
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='Error', linehl='', numhl=''})
      vim.fn.sign_define('DapStopped', {text='➡️', texthl='Info', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointRejected', {text='❌', texthl='WarningMsg', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='WarningMsg', linehl='', numhl=''})
      vim.fn.sign_define('DapLogPoint', {text='🔶', texthl='WarningMsg', linehl='', numhl=''})
      -- ==============================
      -- JS Debug Adapter
      -- ==============================
      local mason_path = vim.fn.stdpath("data")
        .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { mason_path, "${port}" },
        },
      }

      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { mason_path, "${port}" },
        },
      }


      dap.adapters["node"] = function(callback, config)
        config.type = "pwa-node"
        return dap.adapters["pwa-node"](callback, config)
      end

      local js_filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }

      for _, ft in ipairs(js_filetypes) do
        dap.configurations[ft] = {

          -- Debug current file
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch File",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },

          -- Debug TypeScript using tsx
          {
            type = "node",
            request = "launch",
            name = "Launch TSX",
            runtimeExecutable = "tsx",
            program = "${file}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            skipFiles = {
              "<node_internals>/**",
              "${workspaceFolder}/node_modules/**",
            },
          },

          -- Attach to running node process
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node on 9229",
            address = "127.0.0.1",        -- localhost
            port = 9229,                   -- default inspect port
            localRoot = "${workspaceFolder}", -- optional: maps source files
            remoteRoot = "${workspaceFolder}", -- optional: for remote debugging
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Debug Chrome (Frontend)",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            runtimeExecutable = "/usr/bin/google-chrome", -- adjust as needed
            runtimeArgs = { "--remote-debugging-port=9222" },
          },
        }

      end

      -- ==============================
      -- Keymaps
      -- ==============================
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start Debugging" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    end,
  },
}
