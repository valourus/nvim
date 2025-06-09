return {
  'coffebar/neovim-project',
  opts = {
    projects = {
      -- Define your project roots here. Glob patterns are supported.
      '~/code/*',
      '~/code/hydra/*',
      '~/.config/nvim', -- Useful for managing your dotfiles/Neovim config as a project
    },
    picker = {
      type = 'telescope', -- or "fzf-lua" if you prefer
    },

    session_manager_opts = {
      autosave_last_session = false,
      autosave_ignore_dirs = {},
      autosave_ignore_filetypes = {
        'gitcommit',
        'gitrebase',
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required by Telescope
    'nvim-telescope/telescope.nvim', -- If you choose Telescope as your picker
    'Shatur/neovim-session-manager', -- For session management
  },
  init = function()
    -- Enable saving the state of plugins in the session
    vim.opt.sessionoptions:append 'globals'
    vim.keymap.set('n', '<leader>fp', '<cmd>Telescope neovim-project discover<CR>', { desc = 'Find project' })
    vim.keymap.set('n', '<leader>ph', '<cmd>Telescope neovim-project history<CR>', { desc = 'Project history' })
  end,
  lazy = false, -- Or set to true and use a custom keymap to load it
  priority = 100, -- Load early
}
