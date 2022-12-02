local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local lspconfig_util = require 'lspconfig.util'

local common = require 'user.lsp.common'

local on_new_config = function(config, root_dir)
  config.cmd = vim.deepcopy(config.cmd)
  vim.list_extend(config.cmd, {'-v'})
  config.settings = vim.tbl_deep_extend('force', config.settings, {
    pylsp = {
      plugins = {
	pyflakes = {
	  enabled = false,
	},
	mccabe = {
	  enabled = false,
	},
	pycodestyle = {
	  enabled = false,
	  ---[[ Using ignore made things noisier!
	  ignore = {
	    'E302', -- expected 2 blank lines, found 1
	    'E305', -- expected 2 blank lines after class or function definition, found 1
	    'E501', -- line too long (80 > 79 characters)
	    'E731', -- do not assign a lambda
	  },
	  --]]
	},
      },
    },
  })
  -- TODO: factor this part into a separate file
  -- TODO: check if the default root_dir understands our monorepo
  -- Check for MN sterling
  local sterling_venv = lspconfig_util.path.join(root_dir, 'nixd/opt/python3.6')
  if lspconfig_util.path.is_dir(sterling_venv) then
    --print('using the sterling_venv:', sterling_venv)
    config.settings = vim.tbl_deep_extend('force', config.settings, {
      pylsp = {
	plugins = {
	  jedi = {
	    environment = sterling_venv,
	  },
	},
      },
    })
  end
end

lspconfig.pylsp.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  on_new_config = on_new_config,
}
