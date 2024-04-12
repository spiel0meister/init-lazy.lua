return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<leader>tut', vim.cmd.UndotreeToggle)
    end
}
