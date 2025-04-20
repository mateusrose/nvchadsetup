-- lua/utils/snippets.lua
local M = {}

function M.insertReactComponent()
  local name = vim.fn.expand('%:t:r')
  vim.api.nvim_buf_set_lines(0, vim.fn.line('.'), vim.fn.line('.'), false, {
    "const "..name.." = () => {",
    "  return (<> </>)",
    "}",
    "",
    "export default "..name,
  })
end

function M.insertArrowFunction()
  vim.api.nvim_buf_set_lines(0, vim.fn.line('.'), vim.fn.line('.'), false, { "() => {}", })
end

return M
