return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
    size = 18,
    open_mapping = [[<C-\>]],
    shade_terminals = true,
    start_in_insert = true,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Exit terminal mode with double escape
    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

    -- Ensure <C-\> works in visual mode
    vim.keymap.set('v', '<C-\\>', '<Cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
  end,
}
