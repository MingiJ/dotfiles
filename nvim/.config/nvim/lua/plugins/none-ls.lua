return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          extra_args = {
            "--print-width", "80",
            "--no-semi", "false",
            "--single-quote", "true",
            "--trailing-comma", "es5",
            "--tab-width", "2",
          }
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.markdownlint
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
