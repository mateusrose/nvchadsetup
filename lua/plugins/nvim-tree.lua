return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        git = {
          ignore = false,  -- Disable hiding of .gitignore files
        },
      })
    end,
  },
}
