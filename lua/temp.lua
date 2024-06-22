vim.api.nvim_create_user_command("Temp", function()
    local bufnr = vim.api.nvim_create_buf(false, true)

    vim.cmd("buffer " .. bufnr)
end, {})
