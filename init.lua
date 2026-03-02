-- bootstrap lazy.nvim
require "core.bootstrap"
require "options"
require "autocmds"
vim.schedule(function()
  require "mappings"
end)
require "configs.treesitter"
require "configs.mason"
