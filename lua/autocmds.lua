require "nvchad.autocmds"

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
