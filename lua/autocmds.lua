require "nvchad.autocmds"

-- Auto-reload files changed externally (e.g. by Claude Code)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "silent! checktime",
})

-- open NvimTree on start
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "NvimTreeToggle"
})

-- dashboard if no files
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc()==0 then vim.cmd("Nvdash") end
  end,
})
