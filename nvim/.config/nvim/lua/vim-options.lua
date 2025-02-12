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

--error line lsp information
vim.api.nvim_set_keymap(
  'n',
  '<leader>m',
  '<cmd>lua vim.diagnostic.open_float(nil, {scope="line", border="rounded", source="always"})<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
      vim.g.clipboard = {
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
      }
    elseif vim.fn.has("unix") == 1 then
      if vim.fn.executable("xclip") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "xclip -selection clipboard",
            ["*"] = "xclip -selection clipboard",
          },
          paste = {
            ["+"] = "xclip -selection clipboard -o",
            ["*"] = "xclip -selection clipboard -o",
          },
        }
      elseif vim.fn.executable("xsel") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "xsel --clipboard --input",
            ["*"] = "xsel --clipboard --input",
          },
          paste = {
            ["+"] = "xsel --clipboard --output",
            ["*"] = "xsel --clipboard --output",
          },
        }
      end
    end

    vim.opt.clipboard = "unnamedplus"
  end,
  desc = "Lazy load clipboard",
})
