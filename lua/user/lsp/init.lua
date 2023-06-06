require 'user.lsp.jsonls'
require 'user.lsp.pylsp'
require 'user.lsp.lua_ls'
require 'user.lsp.terraformls'
require 'user.lsp.typescript'

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
    'lua_ls',
  },
}
