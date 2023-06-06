local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Plugins
local lazy_opts = {
  -- Updated from folke/lazy.nvim README 2023-01-17
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}
require('lazy').setup({
    -- Git commands in nvim
    'tpope/vim-fugitive',
    -- Fugitive-companion to interact with github
    'tpope/vim-rhubarb',
    -- "gc" to comment visual regions/lines
    {
      'numToStr/Comment.nvim',
      config = true,
    },

    -- Session management
    {
      'rmagatti/auto-session',
      config = true,
    },
    {
      'rmagatti/session-lens',
      config = true,
    },

    -- Which key
    {
      'folke/which-key.nvim',
      config = true,
    },

    -- Enable repeating supported plugin maps with "."
    'tpope/vim-repeat',
    -- Pairs of handy bracket mappings
    'tpope/vim-unimpaired',
    'tpope/vim-surround',

    -- Used by telescope and gitsigns
    'nvim-lua/plenary.nvim',

    -- UI to select things (files, grep results, open buffers...)
    'nvim-telescope/telescope.nvim',

    'EdenEast/nightfox.nvim',
    -- Used by mellifluous theme
    'rktjmp/lush.nvim',
    {
      'ramojus/mellifluous.nvim',
      name = 'mellifluous',
      priority = 1000,
      config = function()
	require('mellifluous').setup()
	vim.cmd 'colorscheme mellifluous'
      end,
    },

    -- Theme inspired by Atom
    'mjlbach/onedark.nvim',
    -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Add git related info in the signs columns and popups
    'lewis6991/gitsigns.nvim',

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    'nvim-treesitter/nvim-treesitter',
    -- Additional textobjects for treesitter
    -- This generates an error during initial installation, if nvim-treesitter
    -- isn't already installed.  I'm still not sure after is safe to use, but
    -- this seems to fix that issue.
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- Collection of configurations for built-in LSP client
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
      'folke/neodev.nvim',
      config = true,
    },
    'neovim/nvim-lspconfig',

    -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'saadparwaiz1/cmp_luasnip',
    -- Snippets plugin
    'L3MON4D3/LuaSnip',

    -- Debug Adapter Protocol
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'rcarriga/nvim-dap-ui',

    'google/vim-jsonnet',

    -- mako templates
    'sophacles/vim-bundle-mako',

}, lazy_opts)
