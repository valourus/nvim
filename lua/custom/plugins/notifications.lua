return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          position = '50%',
        },
      },
      routes = {
        {
          -- Remove the "No information available" messages, as they're showing up way too often when using LSP
          filter = {
            event = 'notify',
            find = 'No information available',
          },
          opts = { skip = true },
        },
      },
    }

    vim.keymap.set({ 'n', 'i', 's' }, '<c-f>', function()
      if not require('noice.lsp').scroll(4) then
        return '<c-f>'
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ 'n', 'i', 's' }, '<c-b>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-b>'
      end
    end, { silent = true, expr = true })
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
