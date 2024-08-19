vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- relative numbers
vim.wo.relativenumber = true
-- dont use arrowkeys
vim.cmd("noremap <Up> <NOP>")
vim.cmd("noremap <Down> <NOP>")
vim.cmd("noremap <Left> <NOP>")
vim.cmd("noremap <Right> <NOP>")

-- really, just dont
vim.cmd("inoremap <Up>    <NOP>")
vim.cmd("inoremap <Down>  <NOP>")
vim.cmd("inoremap <Left>  <NOP>")
vim.cmd("inoremap <Right> <NOP>")


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', 'wincmd k<CR>')
vim.keymap.set('n', '<c-j>', 'wincmd j<CR>')
vim.keymap.set('n', '<c-h>', 'wincmd h<CR>')
vim.keymap.set('n', '<c-l>', 'wincmd l<CR>')


