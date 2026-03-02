return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
      provider = "copilot",             -- Copilot handles chat features
      auto_suggestions_provider = nil,  -- Disable Avante inline suggestions
      behaviour = {
        auto_suggestions = false,       -- No Avante inline suggestions
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
      },
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          model = "gpt-4.1",            -- Best/most advanced for chat
          proxy = nil,
          allow_insecure = false,
          timeout = 30000,
        },
      },
      suggestion = {
        enabled = false,                -- No Avante inline suggestions
        auto_trigger = false,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    {
      "zbirenbaum/copilot.lua",
      requires = {
        "copilotlsp-nvim/copilot-lsp",
        init = function()
          vim.g.copilot_nes_debounce = 500
        end,
      },
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
              accept = "<C-Enter>",
              next = "<C-]>",
              prev = "<C-[>",
              dismiss = "<C-d>",
            },
          },
          panel = { enabled = false },
        })
      vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI" }, {
        callback = function()
          pcall(function()
            vim.api.nvim_buf_del_keymap(0, 'i', '<Esc>')
          end)
        end,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI", "CompleteChanged" }, {
        callback = function()
          pcall(function()
            vim.keymap.del('i', '<Esc>')
          end)
        end,
      })
    -- THIS GOES RIGHT HERE:
      vim.keymap.del('i', '<Esc>') -- First, remove immediately after setup
      -- Then, ensure ESC is always unbound every time you enter insert mode:
      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
          pcall(function()
            vim.keymap.del('i', '<Esc>')
          end)
        end,
      })
        end,
      },
    },
  }
}
