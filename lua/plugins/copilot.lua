return {
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

}
