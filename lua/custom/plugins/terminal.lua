return {
   'akinsho/toggleterm.nvim',
   version = "*",
   opts = {
		direction = 'tab'
   },
	config = function()
       		vim.keymap.set('n', '<A-3>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = "Toggle Terminal" })
	end
}
