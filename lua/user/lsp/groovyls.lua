local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local common = require 'user.lsp.common'

lspconfig.groovyls.setup {
  -- This is the configuration mason-lspconfig provides, but somehow I'm still
  -- getting the configuration from nvim-lspconfig (java -jar
  -- groovy-language-server-all.jar; doesn't work).  I must be missing
  -- something about how mason-lspconfig is supposed to be invoked?
  cmd = { 'groovy-language-server' },
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}
