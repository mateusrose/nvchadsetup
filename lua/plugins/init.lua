return {
  {
    "mhartington/formatter.nvim",
    event="VeryLazy",
    opts = function ()
      return require "custom.configs.formatter"
    end
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        -- Optional configurations if needed
      })
    end,
  },
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
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      })
    end
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
    lazy = false,
    config = function()
      -- Optional keybinding to launch LazyGit
      vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })
    end
  },
  {
    'sindrets/diffview.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      -- Optional keybinding to launch LazyGit
      vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>DiffviewOpen<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>zz', '<cmd>DiffviewClose<CR>', { noremap = true, silent = true })
    end
  },
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
  }
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
