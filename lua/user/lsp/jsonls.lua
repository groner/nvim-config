local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local common = require 'user.lsp.common'

lspconfig.jsonls.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  settings = {
    -- NOTE: json.schemas and ['json.schemas'] don't get merged properly, and
    -- debugging it is a total pain. Because folke/neodev.nvim is already using
    -- json.schemas to register something, we will use that here as well.
    json = {
      schemas = {
	{
	  fileMatch = {'.devcontainer.json', 'devcontainer.json'},
	  url = 'https://raw.githubusercontent.com/devcontainers/spec/main/schemas/devContainer.base.schema.json',
	},
      },
    },
  }
}
