vim.keymap.set('n', '<leader>dh', function()
  require('pretty-ts-errors').show_formatted_error()
end, { desc = 'Show TS error' })

return {
  {
    'youyoumu/pretty-ts-errors.nvim',
  },
}
