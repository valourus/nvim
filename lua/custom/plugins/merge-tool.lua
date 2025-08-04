return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>ld", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
  }, -- Loads only when these keybindings are pressed
  config = function()
    require("diffview").setup({
      -- view = {
      --   default = {
      --     layout = "diff2_fill",
      --   },
      -- },
    })
  end,
}
