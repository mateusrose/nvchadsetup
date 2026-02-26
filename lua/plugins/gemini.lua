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
      strategies = {
        chat = { adapter = "gemini_cli" },
        inline = { adapter = "gemini_cli" }, -- This handles the "logic" for code changes
        agent = { adapter = "gemini_cli" },
      },
      -- Add this section to enable the ghost text/suggestions
      opts = {
        send_code = true,
        use_default_actions = true,
        use_default_prompts = true,
      }
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
