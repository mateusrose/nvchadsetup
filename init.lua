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
require("configs.treesitter")
require("configs.mason")

-- base settings, keymaps, autocommands
require "configs.autocmds"
require "options"
require "nvchad.autocmds"
-- custom snippets & helpers
--require("telescope").load_extension("yank_history")

vim.schedule(function()
  require "mappings"
end)
vim.keymap.set("n", "<space>kk", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set('n', '<space>kc', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local diags = vim.diagnostic.get(bufnr, { lnum = cursor[1] - 1 })
  if #diags > 0 then
    local msg = diags[1].message
    vim.fn.setreg('+', msg)
    vim.notify("Diagnostic copied to clipboard")
  else
    vim.notify("No diagnostic found", vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic under cursor" })
require("utils.snippets")
