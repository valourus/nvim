return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- Set the direction to "horizontal" to make it appear at the bottom
    direction = 'horizontal',
    -- You can also specify the size (height)
    size = 15, -- for example, 15 lines tall
    -- Other options you might want to configure:
    open_mapping = [[<C-\>]], -- Your preferred keybinding to toggle
    shade_terminals = true, -- To darken the terminal background
    start_in_insert = true, -- Start in insert mode when opening
    -- ... and so on
  },
 }
