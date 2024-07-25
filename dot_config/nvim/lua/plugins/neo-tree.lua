return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>"),
  },
}
