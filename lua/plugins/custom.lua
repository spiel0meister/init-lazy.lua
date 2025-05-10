return {
    {
        dir = vim.fn.stdpath("config") .. "/lua/direr/",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "stevearc/oil.nvim",
        },
        config = function()
            local direr = require("direr")
            direr.setup()

            vim.keymap.set("n", "<leader>df", direr.find_files, { desc = "Fuzzy search saved files" })
            vim.keymap.set("n", "<leader>ds", direr.live_grep, { desc = "Live grep saved files" })

            vim.keymap.set("n", "<leader>dd", direr.add_cur_dir, { desc = "Add current directory" })
            vim.keymap.set("n", "<leader>dr", direr.remove_cur_dir, { desc = "Remove current directory" })
            vim.keymap.set("n", "<leader>da", function()
                local dir = vim.fn.input("Enter path of directory: ")
                if vim.fn.isdirectory(dir) == 1 then
                    direr.add_dir(dir)
                else
                    print("Directory does not exist or is not a directory")
                end
            end)

            vim.keymap.set("n", "<leader>dl", direr.toggle_show_dirs, { desc = "Toggle showing directories" })
        end
    },
}
