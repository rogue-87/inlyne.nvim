-- Run with `nvim -u repro.lua`
vim.env.LAZY_STDPATH = ".repro"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

---@diagnostic disable-next-line: missing-fields
require("lazy.minit").repro({
	spec = {
		{
			"rogue-87/inlyne.nvim",
			dir = "~/Code/personal/inlyne.nvim/",
			dev = true,
			opts = {},
		},
	},
})
