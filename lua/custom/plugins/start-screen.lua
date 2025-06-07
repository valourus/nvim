return {
    'git@github.com:goolord/alpha-nvim.git',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        -- Customize the dashboard theme
        dashboard.section.header.val = {
            '                                   ',
            '                                   ',
            '                                   ',
            '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
            '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
            '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
            '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
            '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
            '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
            '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
            ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
            ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
            '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
            '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
        }
        dashboard.section.header.width = 300
        dashboard.section.header.height = 400
        dashboard.section.buttons.val = {
            dashboard.button('f', '  New File', ':enew<CR>'),
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
        require('alpha').setup(dashboard.config)

        alpha.setup(dashboard.opts)
        vim.keymap.set('n', '<Leader>qq', function()
            require('neo-tree.command').execute({ action = 'close' })
            require('alpha').start()
        end, { noremap = true, silent = true })


        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.argc() == 0 then
                    require('alpha').setup(require('alpha.themes.dashboard').config)
                    require('alpha').start()
                end
            end
        })
    end,
}
