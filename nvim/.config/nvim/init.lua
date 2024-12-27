local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.clipboard:append("unnamedplus")
vim.opt.rtp:prepend(lazypath)
vim.o.number = true
require("vim-options")
vim.opt.termguicolors = true
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
