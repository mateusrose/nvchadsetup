require('nvim-treesitter').setup({
  highlight = { enable = true },
})
require('nvim-treesitter').install({
  'angular', 'c_sharp', 'css', 'cpp', 'cuda',
  'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
  'go', 'html', 'htmldjango', 'java', 'javascript',
  'json', 'json5', 'jsonc', 'nginx', 'regex', 'sql',
  'styled', 'typescript', 'tsx', 'xml',
  -- add others as needed
})  -- waits up to 5 minutes
