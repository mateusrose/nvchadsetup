return {
{
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        -- This is the new 2026 adapter for Workspace/Enterprise users
        gemini_code_assist = function()
          return require("codecompanion.adapters").extend("gemini_code_assist", {
            env = {
              project_id = "gen-lang-client-0488495184",
            },
            schema = {
              model = {
                default = "gemini-2.0-flash", -- Or gemini-2.5-pro if your company allows it
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "gemini_code_assist" },
        inline = { adapter = "gemini_code_assist" },
      },
    })

    -- Keybindings
    vim.keymap.set({ "n", "v" }, "<leader>gc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle Gemini Chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ga", "<cmd>CodeCompanionActions<cr>", { desc = "Gemini Actions" })
  end
},
  {
    'milanglacier/minuet-ai.nvim',
    lazy = false,
    config = function()
      require('minuet').setup({
        provider = 'gemini',
        provider_options = {
          gemini = {
            model = 'gemini-2.0-flash',
            -- This dynamically fetches your company token from gcloud
            api_key = function()
              return vim.fn.system("gcloud auth application-default print-access-token"):gsub("%s+", "")
            end,
          },
        },
      })
      -- Your existing Alt+y keybinding
      vim.keymap.set('i', '<A-y>', function()
        require('minuet').make_completion_request()
      end, { desc = "Trigger Gemini Autocomplete" })
    end
  }
}
