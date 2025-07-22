return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		cmd = "ToggleTerm",
    	build= ":ToggleTerm",
    	keys = { { "<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal", } },
	},
}
