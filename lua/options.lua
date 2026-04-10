require "nvchad.options"

-- folds
vim.o.foldmethod = "indent"
vim.o.foldlevel  = 4

-- python host
vim.g.python3_host_prog = '/home/cms/.pyenv/versions/3.12.13'

-- tabs & indent
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true
vim.opt.autoindent  = true
vim.opt.smartindent = true

-- terminal title
vim.opt.title = true
vim.opt.titlestring = "nvim - %{fnamemodify(getcwd(), ':~:h:t') .. '/' .. fnamemodify(getcwd(), ':t')}"
