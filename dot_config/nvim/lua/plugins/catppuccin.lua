return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 999,
	config = function()
		vim.cmd.colorscheme("catppuccin")
		require("catppuccin").setup({
			flavor = "mocha",
		})
	end,
}
