require("mason").setup()

require("sonarlint").setup {
  server = {
    cmd = {
      "sonarlint-language-server",
      -- Optionally include path to node, if needed
      -- "node",
      -- "/path/to/sonarlint-language-server.js",
      "-stdio",
      "-analyzers",
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
      vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
    },
  },
  filetypes = {
    "cs",
    "dockerfile",
    "python",
    -- "html",
    "cpp",
    "java",
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  settings = {
    sonarlint = {
      -- rules = {
        -- Example: disable a rule
        -- ["typescript:S1234"] = { level = "off" }
      -- },
    },
  },
}

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
    "sonarlint-language-server",
  },
  auto_update = false,
  run_on_start = true,
})
