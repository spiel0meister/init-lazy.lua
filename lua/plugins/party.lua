return {
    {
        "ggandor/leap.nvim",
    },
    {
        "folke/todo-comments.nvim",
        config = function ()
            require("todo-comments").setup()
        end
    },
    {
        'goolord/alpha-nvim',
        config = function ()
            require("alpha").setup(require("alpha.themes.startify").config)
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        config = function ()
            require("ibl").setup()
        end
    },
    {
        "mg979/vim-visual-multi",
    },
    {
        "tpope/vim-commentary"
    },
    {
        "paretje/nvim-man"
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
