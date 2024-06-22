local function mysplit(inputstr)
    local sep = "\n"
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

vim.api.nvim_create_user_command("Man", function (tabl)
    local man_page = vim.fn.system("man " .. tabl.args)
    local man_page_lines = mysplit(man_page)

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, man_page_lines)
    vim.cmd("sb " .. bufnr)
end, { nargs = 1 })
