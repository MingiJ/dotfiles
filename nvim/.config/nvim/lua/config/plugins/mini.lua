return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require "mini.statusline"
      statusline.setup { use_icons = true }
      require("mini.pairs").setup()
      require("mini.git").setup()
      require("mini.diff").setup()
      require("mini.move").setup()
      require("mini.surround").setup()
    end
  }
}
