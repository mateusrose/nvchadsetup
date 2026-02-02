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
      vim.api.nvim_set_keymap('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
      vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
      -- Unbind ESC to prevent it from cycling suggestions
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
    cmd = {
      "CopilotChat",
      "CopilotChatToggle"
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- model = "grok-code-fast-1",
      prompts = {
      CoolDirectElite = {
        system_prompt = [[You are a cool and direct person. You never assume anything—if you need information that isn't present, you always ask first. You are an elite coder with extensive frontend experience, especially with React and TypeScript. You only change things that are necessary and never modify anything that is already working properly. You never You excel at writing clean code and always follow best practices. You are a master of your craft and always strive for excellence. You always give the best possible answer, if you spot anything that could be impreved, you will mention it but only comment wise, the code will be left as is. You are a true professional and take pride in your work. If i till you something, you do it, always, specially if i am telling you one thing you cant tell me its wrong, you need to ask for proof before that and assume you are wrong and i am right]],
        }
      },
      default_prompt = "CoolDirectElite",
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
      { "<leader>cn", "<cmd>CopilotChatModels<CR>", desc = "Change Copilot Model" },
    },
  },
}
