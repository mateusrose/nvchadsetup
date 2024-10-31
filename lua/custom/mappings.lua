local M = {

}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd>DapContinue <CR>",
      "Run or continue the debugger"
    }
  }
}

function M.setup()
  local map = vim.keymap.set
  -- Register DAP mappings
  for key, value in pairs(M.dap.n) do
    map("n", key, value[1], { desc = value[2] })
  end
end


return M
