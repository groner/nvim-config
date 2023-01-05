local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

local ok, luasnip = pcall(require, 'luasnip')

cmp.setup {
  enabled = function()
    local ccc = require 'cmp.config.context'
    local ts_comment = ccc.in_treesitter_capture('comment') == true
    local vs_comment = ccc.in_syntax_group('Comment')
    return not ts_comment and not vs_comment
  end,
  snippet = {
    expand = function(args)
      if luasnip ~= nil then
	luasnip.lsp_expand(args.body)
      end
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip ~= nil and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip ~= nil and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
  },
}
