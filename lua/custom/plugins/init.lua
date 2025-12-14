vim.opt.shadafile = 'NONE'
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'

vim.keymap.set('i', '<C-v>', function()
  return vim.fn.getreg '+'
end, { expr = true, noremap = true })
vim.keymap.set('n', '<C-v>', '"+p')

-- disable the F1 help key, I kept hitting it accidentally
vim.keymap.set({ 'n', 'i', 'c', 's', 'o', 'x' }, '<F1>', '<Nop>', { noremap = true, silent = true })

local ERROR_SEVERITY = vim.diagnostic.severity.ERROR

-- Overwrite ]d to jump to the NEXT Error only
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump {
    count = 1,
    severity = ERROR_SEVERITY,
  }
end, { desc = 'Next ERROR Diagnostic' })

-- Overwrite [d to jump to the PREVIOUS Error only
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump {
    count = -1,
    severity = ERROR_SEVERITY,
  }
end, { desc = 'Previous ERROR Diagnostic' })

return {
  'nvim-tree/nvim-web-devicons',
  'pocco81/auto-save.nvim',
}
