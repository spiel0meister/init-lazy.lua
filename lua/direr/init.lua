local oil = require("oil")
local find_files = require("telescope.builtin").find_files
local live_grep = require("telescope.builtin").live_grep

local M = {}

--- @type string[]
local dirs = {}

--- @type integer
local winnr = 0

--- @param dir string
M.add_dir = function(dir)
    for _, elements in ipairs(dirs) do
        if elements == dir then
            vim.print("Directory " .. dir .. " is already tracked")
            return
        end
    end

    table.insert(dirs, 1, dir)
end

--- @param dir string
M.remove_dir = function(dir)
    for i, elements in ipairs(dirs) do
        if elements == dir then
            table.remove(dirs, i)
            return
        end
    end

    vim.print("Directory " .. dir .. " is not tracked")
end

M.add_cur_dir = function()
    local dir = oil.get_current_dir()
    if dir ~= nil then
        M.add_dir(dir)
    end
end

M.remove_cur_dir = function()
    local dir = oil.get_current_dir()
    if dir ~= nil then
        M.remove_dir(dir)
    end
end

M.find_files = function()
    find_files({ search_dirs = dirs })
end

M.live_grep = function()
    live_grep({ search_dirs = dirs })
end

M.toggle_show_dirs = function()
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_create_autocmd({ "BufLeave" }, {
        buffer = bufnr,
        callback = function(e)
            winnr = 0
            dirs = {}

            local lines = vim.api.nvim_buf_get_lines(e.buf, 0, -1, true)
            for _, line in ipairs(lines) do
                if vim.fn.isdirectory(line) == 1 then
                    M.add_dir(line)
                end
            end
        end,
    })

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, dirs)

    local rows = vim.opt.lines:get()
    local cols = vim.opt.columns:get()

    if winnr ~= 0 then
        vim.api.nvim_win_close(winnr, false)
    else
        winnr = vim.api.nvim_open_win(bufnr, true, {
            relative = "editor",
            width = cols - 10 * 2,
            height = rows - 10 * 2,
            row = 10,
            col = 10,
            border = "rounded",
        })
    end
end

M.setup = function()
    M.add_dir(vim.uv.cwd())
end

return M
