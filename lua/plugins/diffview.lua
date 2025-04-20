return {
  {
    'sindrets/diffview.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      -- Optional keybinding to launch LazyGit
      vim.api.nvim_set_keymap('n', '<leader>zc', '<cmd>DiffviewOpen<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>zz', '<cmd>DiffviewClose<CR>', { noremap = true, silent = true })
    end
  },
}
