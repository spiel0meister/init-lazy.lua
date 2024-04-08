return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "lewis6991/gitsigns.nvim"
    },
    config = function()
        local gitsigns = require("gitsigns")
        local neogit = require("neogit")

        neogit.setup()
        vim.keymap.set("n", "<leader>gs", neogit.open)
        vim.keymap.set("n", "<leader>gc", function() neogit.open({ "commit" }) end)

        gitsigns.setup()
        vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Previe hunk" })
        vim.keymap.set("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
    end
}
