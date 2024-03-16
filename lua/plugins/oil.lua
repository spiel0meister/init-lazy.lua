return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      require("oil").setup({})

      vim.keymap.set("n", "<leader>pv", require("oil").open, { desc = "Open parent directory" })
  end
}
