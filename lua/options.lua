require "nvchad.options"
-- lua/configs/options.lua
-- base46 caches
vim.g.base46_cache = vim.fn.stdpath("data").."/nvchad/base46/"

-- folds
vim.o.foldmethod = "indent"
vim.o.foldlevel  = 4

-- python host
vim.g.python3_host_prog = '/home/mateusrosa/.pyenv/versions/3.8.20'

-- tabs & indent
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true
vim.opt.autoindent  = true
vim.opt.smartindent = true

-- load theme
dofile(vim.g.base46_cache.."defaults")
dofile(vim.g.base46_cache.."statusline")
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
