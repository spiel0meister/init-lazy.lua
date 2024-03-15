return {
    "folke/trouble.nvim", 
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end, { desc = "Toggle trouble" })
        vim.keymap.set("n", "<leader>tw", function() trouble.toggle("workspace_diagnostics") end,
            { desc = "Toggle workspace diagnostics" })
        vim.keymap.set("n", "<leader>td", function() trouble.toggle("document_diagnostics") end,
            { desc = "Toggle document diagnostics" })
        vim.keymap.set("n", "<leader>tq", function() trouble.toggle("quickfix") end, { desc = "Toggle quickfix" })
        vim.keymap.set("n", "<leader>tll", function() trouble.toggle("loclist") end, { desc = "Toggle loclist" })
        vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = "Toggle lsp references" })
    end
}
