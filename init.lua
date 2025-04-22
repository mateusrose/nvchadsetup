vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

local lazy_config = require "configs.lazy"
-- bootstrap lazy.nvim
require "core.bootstrap"

-- load plugin manager configuration
require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("configs.dap")

-- base settings, keymaps, autocommands
require "configs.autocmds"
require "options"
require "nvchad.autocmds"
-- custom snippets & helpers

require("telescope").load_extension("yank_history")

vim.schedule(function()
  require "mappings"
end)

require("utils.snippets")
