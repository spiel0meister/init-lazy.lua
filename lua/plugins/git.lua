return {
    "tpope/vim-fugitive",
    dependencies = {
        "lewis6991/gitsigns.nvim"
    },
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()

        vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Previe hunk" })
        vim.keymap.set("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
    end
}
