-- Based on https://www.reddit.com/r/neovim/comments/silikv/debugging_in_neovim/

local dap = require('dap')
--local uiv = require('dap.ui.variables')
local uiw = require('dap.ui.widgets')
local which_key = require('which-key')

local function float_scopes()
  uiw.centered_float(uiw.scopes)
end

which_key.register({
    d = {
      name = "Debug",
      s = {
	name = "Step",
	c = { dap.continue, "Continue" },
	v = { dap.step_over, "Step Over" },
	i = { dap.step_into, "Step Into" },
	o = { dap.step_out, "Step Out" },
      },
      h = {
	name = "Hover",
	--h = { uiv.hover, "Hover" },
	--v = { uiv.visual_hover, "Visual Hover" },
      },
      u = {
	name = "UI",
	h = { uiw.hover, "Hover" },
	f = { float_scopes, "Float" },
      },
      r = {
	name = "Repl",
	o = { dap.repl.open, "Open" },
	l = { dap.repl.run_last, "Run Last" },
      },
      b = {
	name = "Breakpoints",
	c = {
	  "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	  "Breakpoint Condition",
	},
	m = {
	  "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
	  "Log Point Message",
	},
	t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
      },
      --c = { dap.scopes, "Scopes" },
      --i = { dap.toggle, "Toggle" },
    },
  }, { prefix = "<leader>" })
