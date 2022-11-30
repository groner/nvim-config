local lualine = require 'lualine'

lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'nord',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_b = { 'branch', 'diff', 'diagnostics', 'dap' },
  }
}
