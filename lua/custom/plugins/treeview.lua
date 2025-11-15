vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Oil: current directory" })

vim.keymap.set("n", "<leader>E", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Oil: project root" })

return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
