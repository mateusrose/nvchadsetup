require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local km = vim.api.nvim_set_keymap

map("n", "<leader>fv", function()
    require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Search in all open buffers" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }
-- Yanky Put
map("n", "p", "<Plug>(YankyPutAfter)", opts)
map("n", "P", "<Plug>(YankyPutBefore)", opts)
-- Yanky Cycle History
--map("n", "<c-n>", "<Plug>(YankyNextEntry)", opts)
--map("n", "<c-p>", "<Plug>(YankyPreviousEntry)", opts)

-- Yank Highlight
map("n", "y", "<Plug>(YankyYank)", opts)
-- lua/configs/keymaps.lua
-- telescope
km("n","<leader>fr",":Telescope resume<CR>",opts)
km("n","<leader>fn",":Nvdash<CR>",opts)

-- … add more here

--if dap_mappings.setup then
 --   dap_mappings.setup()  -- Call the setup function to register DAP mappings
--end

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
