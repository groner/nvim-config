-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    'git', 'clone',
      'https://github.com/wbthomason/packer.nvim',
      install_path
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Auto reload
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua,plugins.lua source <afile> | PackerSync
  augroup end
]])

local file_config = function(name)
  -- NOTE: expand('$MYVIMRC') works, but expand('$MYVIMRC:p') does not
  local cfg_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ':h')
  local cfg_file = cfg_dir .. '/lua/user/plugin/' .. name .. '.lua'
  return string.format([[
      local cfg_file = %q
      if vim.fn.filereadable(cfg_file) then
	dofile(cfg_file)
      end
    ]], cfg_file)
end

local dummy_setup_config = function(name)
  -- It would be nice to be able to proxy at least a simple map here, but lua
  -- doesn't make anything that easy
  return string.format([[
    require(%q).setup({})
  ]], name)
end

-- Plugins
local packer = require('packer')

packer.startup({
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  },
  function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Git commands in nvim
    use 'tpope/vim-fugitive'
    -- Fugitive-companion to interact with github
    use 'tpope/vim-rhubarb'
    -- "gc" to comment visual regions/lines
    use {
      'numToStr/Comment.nvim',
      config = dummy_setup_config('Comment'),
    }

    -- Which key
    use {
      'folke/which-key.nvim',
      config = dummy_setup_config('which-key'),
    }

    -- Enable repeating supported plugin maps with "."
    use 'tpope/vim-repeat'
    -- Pairs of handy bracket mappings
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'

    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    use 'EdenEast/nightfox.nvim'
    use {
      'meliora-theme/neovim',
      requires = {'rktjmp/lush.nvim'},
      config = dummy_setup_config('meliora'),
    }

    -- Theme inspired by Atom
    use 'mjlbach/onedark.nvim'
    -- Fancier statusline
    use {
      'nvim-lualine/lualine.nvim',
      after = { 'nvim-dap' },
      config = file_config('lualine'),
    }
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Collection of configurations for built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'

    -- Debug Adapter Protocol
    use {
      'mfussenegger/nvim-dap',
      after = { 'which-key.nvim' },
      config = file_config('dap'),
    }
    use {
      'mfussenegger/nvim-dap-python',
      after = { 'nvim-dap' },
      -- Don't use dummy_setup_config here, dap-python.setup expects an
      -- optional string, not a table
      config = [[require('dap-python').setup()]],
    }
    use {
      'rcarriga/nvim-dap-ui',
      after = { 'nvim-dap' },
    }

    use 'google/vim-jsonnet'

    if PACKER_BOOTSTRAP then
      packer.sync()
    end
  end})
