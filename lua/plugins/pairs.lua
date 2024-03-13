return {
    "jiangmiao/auto-pairs",
    dependencies = {
        "kylechui/nvim-surround",
    },
    config = function()
        require("nvim-surround").setup({})
    end
}
