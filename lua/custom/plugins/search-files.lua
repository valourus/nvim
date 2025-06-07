vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })

return {
  'nvim-lua/plenary.nvim', -- Required dependency
  'nvim-telescope/telescope.nvim', tag = '0.1.8', -- or newer tag/branch
  dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- For fzf-native speed
  config = function()
        require('telescope').setup({})
  end,
}
