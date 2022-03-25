local M = require('lualine.component'):extend()

function M:init(options)
  M.super.init(self, options)
  self.dap = require('dap')
end

function M:update_status()
  return self.dap.status()
end

return M
