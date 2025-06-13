require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = {
    "css-lsp",
    "css-variables-language-server",
    "cssmodules-language-server",
    "eslint-lsp",
    "eslint_d",
    "html-lsp",
    "js-debug-adapter",
    "json-lsp",
    "lua-language-server",
    "nextls",
    "prettier",
    "pyright",
    "rust-analyzer",
    "typescript-language-server",
    "tailwindcss-language-server",
    "vue-language-server",
  },
  auto_update = false,
  run_on_start = true,
})
