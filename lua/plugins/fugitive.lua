return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      -- Optional: Map a key for viewing commit history
      vim.keymap.set("n", "<leader>gh", ":0Gclog<CR>", { desc = "File commit history at cursor" })
    end,
  },
}
