local M = {}

local ok, telescope_builtin = pcall(require, 'telescope.builtin')
if not ok then
  telescope_builtin = nil
end

M.on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  if telescope_builtin ~= nil then
    vim.keymap.set('n', '<leader>so', telescope_builtin.lsp_document_symbols, opts)
  end
  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
