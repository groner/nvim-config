local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local common = require 'user.lsp.common'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}
