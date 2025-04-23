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
              show_hidden = true,
          },
          is_hidden_file = function(name, _)
              return vim.startswith(name, ".") and not vim.startswith(name, ".git")
          end
      })

      vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open parent directory" })

      vim.keymap.set("n", "<leader>oc", function()
          local dir = oil.get_current_dir()
          local entry = oil.get_cursor_entry()
          local entry_name = entry.name
          local absolute = dir .. entry_name
          vim.fn.setreg("", absolute)
      end, { desc = "Copy the absolute path of the current entry" })
  end
}
