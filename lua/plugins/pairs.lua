return {
    "m4xshen/autoclose.nvim",
    dependencies = {
        "kylechui/nvim-surround",
    },
    config = function()
        require("autoclose").setup({
            keys = {
                -- ["{"] = { close = true, escape = true, pair = "{}" },
                -- ["["] = { close = true, escape = true, pair = "[]" },
                -- ["("] = { close = true, escape = true, pair = "()" },
                ["("] = { escape = false, close = true, pair = "()" },
                ["["] = { escape = false, close = true, pair = "[]" },
                ["{"] = { escape = false, close = true, pair = "{}" },

                [">"] = { escape = false, close = false, pair = "<>" },
                [")"] = { escape = false, close = false, pair = "()" },
                ["]"] = { escape = false, close = false, pair = "[]" },
                ["}"] = { escape = false, close = false, pair = "{}" },

                ['"'] = { escape = false, close = true, pair = '""' },
                ["'"] = { escape = false, close = true, pair = "''" },
                ["`"] = { escape = false, close = true, pair = "``" },
            },
            options = {
                disabled_filetypes = { "text" },
                disable_when_touch = false,
                touch_regex = "[%w(%[{]",
                pair_spaces = false,
                auto_indent = true,
                disable_command_mode = false,
            },
        })
        require("nvim-surround").setup({})
    end
}
