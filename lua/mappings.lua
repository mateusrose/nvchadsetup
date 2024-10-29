require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>fv", function()
    require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Search in all open buffers" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
