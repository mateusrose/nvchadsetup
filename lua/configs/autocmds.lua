-- lua/configs/autocmds.lua
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

-- custom user commands
vim.api.nvim_create_user_command("Af", require("utils.snippets").insertArrowFunction, {})
vim.api.nvim_create_user_command("Comp", require("utils.snippets").insertReactComponent, {})
