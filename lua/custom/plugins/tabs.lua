
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
	
	vim.keymap.set('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Go to previous buffer' })
	vim.keymap.set('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Go to next buffer' })
        vim.opt.termguicolors = true
        local bufferline = require('bufferline')
        bufferline.setup {

            options = {
                mode = "buffers",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
		separator_style = "slope"
            }
        }
    end
}
