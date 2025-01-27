vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

--fold method
vim.o.foldmethod = "indent"
vim.o.foldlevel = 4

-- require("plugins.dap")
-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("telescope").load_extension("yank_history")

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "NvimTreeToggle"
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.g.python3_host_prog = '/home/mateusrosa/.pyenv/versions/3.8.20'


require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- tab change
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true


-- React component shortcut
function InsertReactComponent()
  -- Get the current filename without extension
  local filename = vim.fn.expand('%:t:r')

  -- Insert the component boilerplate code at the current line
  vim.api.nvim_buf_set_lines(0, vim.fn.line('.'), vim.fn.line('.'), false, {
    'const ' .. filename .. ' = () => {',
    '  return (',
    '    <>',
    '    </>',
    '  )',
    '}',
    '',
    'export default ' .. filename
  })
end

function InsertArrowFunction()
  -- Insert the arrow function snippet at the current line
  vim.api.nvim_buf_set_lines(0, vim.fn.line('.'), vim.fn.line('.'), false, {
    '() => {',
    '}'
  })
end

-- Define the :Af command to trigger InsertArrowFunction
vim.api.nvim_create_user_command('Af', InsertArrowFunction, {})

-- Create a custom command :Rec to call the function


vim.api.nvim_create_user_command('Comp', InsertReactComponent, {})
