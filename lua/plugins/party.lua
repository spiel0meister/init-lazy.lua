return {
    "ggandor/leap.nvim",
    dependencies = {
        "folke/todo-comments.nvim",
        'goolord/alpha-nvim',
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        "mg979/vim-visual-multi",
        "tpope/vim-commentary"
    },
    config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
        require("ibl").setup()
        require("todo-comments").setup()
    end
}
