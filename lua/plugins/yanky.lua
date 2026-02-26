return {
  {
    'gbprod/yanky.nvim',
    lazy = false,
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>fy", ":Telescope yank_history<CR>", { noremap = true, silent = true })
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada", -- Saves yank history to shada file
          sync_with_numbered_registers = true,
        },
        system_clipboard = {
          sync_with_ring = true, -- Syncs yanks with the system clipboard
        },
        highlight = {
          on_put = true, -- Highlight text after putting
          on_yank = true, -- Highlight text when yanked
          timer = 200, -- Highlight duration
        },
        preserve_cursor_position = {
          enabled = true, -- Keeps the cursor position after pasting
        },
      })
    end,
  },
}
