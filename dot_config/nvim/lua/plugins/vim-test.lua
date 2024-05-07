return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  vim.keymap.set('n','<leader>t', ':TestNearest<CR>'),
  vim.keymap.set('n','<leader>T', ':TestNearest<CR>'),
  vim.keymap.set('n','<leader>a', ':TestNearest<CR>'),
  vim.keymap.set('n','<leader>l', ':TestNearest<CR>'),
  vim.keymap.set('n','<leader>g', ':TestNearest<CR>'),
  vim.cmd("let test#strategy = 'vimux'")
}
