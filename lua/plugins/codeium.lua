return {
    'Exafunction/codeium.vim',
    -- run = ":CodeiumAuth",
    config = function()
        vim.keymap.set("i", "<c-j>", function() return vim.fn["codeium#CycleCompletions"](1) end,
            { expr = true, desc = "Codeium show next completion" })
        vim.keymap.set("i", "<c-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end,
            { expr = true, desc = "Codeium show prev completion" })
        vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end,
            { expr = true, desc = "Codeium clear" })
    end
}
