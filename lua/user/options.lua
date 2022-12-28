-- Kg changes
vim.o.wrap = false
vim.o.scrolloff = 15
vim.o.sidescrolloff = 20
vim.o.shiftwidth = 4
vim.o.textwidth = 79

vim.o.timeoutlen = 500

-- This is slow, and something is activating it even though the python lsp
-- stuff runs out of a separate venv.
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true

-- Improve cursor visibility, this fixes the cursor being hard to see when it's
-- over the muted indent marks.
vim.o.guicursor = table.concat({
  'n-v-c-sm:block',
  'i-ci-ve:ver25',
  'r-cr-o:hor20',
  'a:Cursor/lCursor',
}, ',')

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
