return {
	"nvim-lualine/lualine.nvim",
	extensions = { "wakatime" },
	config = function()
    require("lualine").setup({
			options = {
				theme = "dracula",
			}
   })
	end
}
