local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local common = require 'user.lsp.common'

lspconfig.tsserver.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}