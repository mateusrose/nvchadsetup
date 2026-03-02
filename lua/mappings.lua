require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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

local km = vim.api.nvim_set_keymap

map("n", "<leader>fv", function()
    require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Search in all open buffers" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }
--[[
-- Yanky Put
map("n", "p", "<Plug>(YankyPutAfter)", opts)
map("n", "P", "<Plug>(YankyPutBefore)", opts)
-- Yanky Cycle History
--map("n", "<c-n>", "<Plug>(YankyNextEntry)", opts)
--map("n", "<c-p>", "<Plug>(YankyPreviousEntry)", opts)

-- Yank Highlight
map("n", "y", "<Plug>(YankyYank)", opts)
]]
-- lua/configs/keymaps.lua
-- telescope
km("n","<leader>fr",":Telescope resume<CR>",opts)
km("n","<leader>fn",":Nvdash<CR>",opts)

map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP: Telescope references" })
require("utils.snippets")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
