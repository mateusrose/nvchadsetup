return
  {
    {
      'nvimdev/lspsaga.nvim',
      config = function()
        require('lspsaga').setup({
          -- Add any custom configuration here if needed
        })
      end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter', -- Optional
        'nvim-tree/nvim-web-devicons',     -- Optional
      }
    }
  }
