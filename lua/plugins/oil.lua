return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      local oil = require("oil")
      oil.setup({
          columns = {
              "icon",
              "size",
              "mtime",
          },
          view_options = {
              show_hidden = true
          }
      })

      vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open parent directory" })
  end
}
