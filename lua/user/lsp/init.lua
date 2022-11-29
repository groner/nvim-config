require 'user.lsp.pylsp'
require 'user.lsp.sumneko_lua'

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'sumneko_lua',
  },
})
