vim.opt.shadafile = 'NONE'
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"

-- Remove the help buffer opening with <F1>
vim.keymap.set({'n', 'i', 'c', 's', 'o', 'x'}, '<F1>', '<Nop>', { noremap = true, silent = true });

return {
  'nvim-tree/nvim-web-devicons',
  'pocco81/auto-save.nvim',
}
