require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set({ "n", "t" }, "<space>tt", "<cmd>FloatermToggle<CR>")
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
local job_id = 0
vim.keymap.set("n", "<space>to", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)

  job_id = vim.bo.channel
end)

local current_command = ""

-- keymaps

vim.keymap.set("n", "<space>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select")
      .select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select")
      .select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select")
      .select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select")
      .select_textobject("@class.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move")
      .goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set('n', '<C-l>', function()
  vim.cmd('nohlsearch')
  vim.cmd('normal! <C-l>')
end, { silent = true })
