vim.opt.shadafile = 'NONE'
vim.opt.relativenumber = true

vim.keymap.set({'n', 'i', 'c', 's', 'o', 'x'}, '<F1>', '<Nop>', { noremap = true, silent = true });
return {
  'nvim-tree/nvim-web-devicons',
  'pocco81/auto-save.nvim',
}
