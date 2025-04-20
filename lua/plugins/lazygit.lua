return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
    lazy = false,
    config = function()
      -- Optional keybinding to launch LazyGit
      vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })
    end
  },
}
