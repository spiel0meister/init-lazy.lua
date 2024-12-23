return {
    {
        "ggandor/leap.nvim",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            local todo_comments = require("todo-comments")
            todo_comments.setup()

            vim.keymap.set("n", "<leader>tdn", todo_comments.jump_next)
            vim.keymap.set("n", "<leader>tdp", todo_comments.jump_prev)

            vim.keymap.set("n", "<leader>ptd", vim.cmd["TodoTelescope"])
        end
    },
    {
        'goolord/alpha-nvim',
        config = function ()
            require("alpha").setup(require("alpha.themes.startify").config)
        end
    },
    {
        "mg979/vim-visual-multi",
    },
    {
        "tpope/vim-commentary"
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
