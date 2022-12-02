require 'user.lsp.pylsp'
require 'user.lsp.sumneko_lua'

local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

mason.setup()

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    'sumneko_lua',
  },
}
