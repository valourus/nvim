
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "DirChanged", -- Load bufferline only when directory is changed
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
                        filetype = "Project files",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
                separator_style = "slope",
                -- Special handling for alpha buff:er
                custom_filter = function(buf_number, buf_numbers)
                    -- Hide the buffer if it's the alpha start screen
                    local ft = vim.bo[buf_number].filetype
                    if ft == "alpha" then
                        return false
                    end

                    -- Also hide unnamed buffers at startup
                    local bufname = vim.fn.bufname(buf_number)
                    if bufname == "" and vim.fn.bufwinnr(buf_number) == -1 then
                        return false
                    end

                    return true
                end
            }
        }
    end
}
