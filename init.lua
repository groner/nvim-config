require 'user.plugins'

require 'user.options'
require 'user.keymaps'

require 'user.cmp'
require 'user.dap'
require 'user.gitsigns'
require 'user.lsp'
require 'user.lualine'
require 'user.telescope'
require 'user.treesitter'

vim.cmd [[
  augroup Kai
    au!

    au FileType html,xml                setl sw=2
    au FileType css                     setl sw=2
    au FileType javascript,typescript,typescriptreact setl sw=2
    au FileType lua                     setl sw=2
    au FileType terraform               setl sw=2
  augroup end
]]

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- vim: sw=2 et
