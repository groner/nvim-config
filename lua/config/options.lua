-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = false
vim.o.scrolloff = 25
vim.o.sidescrolloff = 40
vim.o.tabstop = 8

local pynvim_python3 = vim.fs.normalize("~/.local/opt/pynvim/bin/python3")
if vim.fn.executable(pynvim_python3) then
  vim.g.python3_host_prog = pynvim_python3
end
