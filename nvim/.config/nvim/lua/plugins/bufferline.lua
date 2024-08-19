return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "Neotree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
          }
        }
      }
    })
    -- Set keymap outside of the setup function
    vim.keymap.set('n', '<leader>bl', ':BufferLinePick<CR>', { noremap = true, silent = true })
  end
}

