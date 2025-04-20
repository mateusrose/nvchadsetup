return {
  -- Copilot suggestions
  {
    "zbirenbaum/copilot.lua",
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
      -- Unbind ESC to prevent it from cycling suggestions
    vim.api.nvim_set_keymap('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
    end,
  },
  -- nvim-cmp integration
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatToggle" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
    },
  },
}
