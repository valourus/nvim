return {
  'git@github.com:goolord/alpha-nvim.git',
  priority = 1000, -- Make sure alpha loads before other plugins
  lazy = false, -- Load alpha immediately when Neovim starts
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Customize the dashboard theme
    dashboard.section.header.val = {
      '=====================================================================',
      '=====================================================================',
      '========                                    .-----.          ========',
      '========         .----------------------.   | === |          ========',
      '========         |.-""""""""""""""""""-.|   |-----|          ========',
      '========         ||                    ||   | === |          ========',
      '========         ||       NEOVIM       ||   |-----|          ========',
      '========         ||                    ||   | === |          ========',
      '========         ||                    ||   |-----|          ========',
      '========         ||:q                  ||   |:::::|          ========',
      '========         | -..................- |   |____o|          ========',
      '========         `"")----------------(""`   ___________      ========',
      '========        /::::::::::|  |::::::::::\\  \\ no mouse \\     ========',
      '========       /:::========|  |==hjkl==:::\\  \\ required \\    ========',
      '========      \'""""""""""""\'  \'""""""""""""\'  \'""""""""""\'   ========',
      '========                                                     ========',
      '=====================================================================',
      '=====================================================================',
    }
    dashboard.section.header.width = 300
    dashboard.section.header.height = 400
    dashboard.section.buttons.val = {
      dashboard.button('n', '  New File', ':enew<CR>'),
      dashboard.button('f', ' Find File', function()
        require('telescope.builtin').find_files { cwd = '/home/koenvanderels/', hidden = true }
      end),
      dashboard.button('p', '  Find Project', ':Telescope neovim-project discover<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    local function footer()
      local datetime = os.date '%Y-%m-%d %H:%M'
      local version = vim.version()
      local nvim_version = string.format('     v%d.%d.%d', version.major, version.minor, version.patch)
      return {
        '',
        datetime,
        '',
        nvim_version,
        '',
      }
    end
    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts = {
      position = 'center',
    }
    dashboard.section.footer.opts.hl = 'Constant'
    -- Only need to call setup once
    alpha.setup(dashboard.config)
    vim.keymap.set('n', '<Leader>qq', function()
      require('neo-tree.command').execute { action = 'close' }
      require('alpha').start()
    end, { noremap = true, silent = true })

    -- Create a dedicated augroup for alpha
    local alpha_group = vim.api.nvim_create_augroup('AlphaStartScreen', { clear = true })

    vim.api.nvim_create_autocmd('VimEnter', {
      group = alpha_group,
      callback = function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end
        vim.defer_fn(function()
          -- Start alpha
          require('alpha').start()

          -- Hide command line
          vim.cmd 'set cmdheight=0'
        end, 10)
      end,
      desc = 'Start Alpha when Neovim is opened with no arguments',
    })
  end,
}
