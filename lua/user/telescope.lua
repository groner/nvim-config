local telescope = require 'telescope'

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = {
      'node_modules',
    },
  },
}

local keymap = vim.keymap.set
local telescope_builtin = require 'telescope.builtin'

--Add leader shortcuts
keymap('n', '<leader><space>', function()
  telescope_builtin.buffers({sort_mru = true})
end)
keymap('n', '<leader>sf', function()
  telescope_builtin.find_files { previewer = false }
end)
keymap('n', '<leader>sb', telescope_builtin.current_buffer_fuzzy_find)
keymap('n', '<leader>sh', telescope_builtin.help_tags)
keymap('n', '<leader>st', telescope_builtin.tags)
keymap('n', '<leader>sd', telescope_builtin.grep_string)
keymap('n', '<leader>sp', telescope_builtin.live_grep)
keymap('n', '<leader>so', function()
  telescope_builtin.tags { only_current_buffer = true }
end)
keymap('n', '<leader>?', telescope_builtin.oldfiles)
