local spinner_table = {
    "⠋",
    "⠙",
    "⠹",
    "⠸",
    "⠼",
    "⠴",
    "⠦",
    "⠧",
    "⠇",
    "⠏",
}

local spinner_count = 10

return {
    'nvim-lualine/lualine.nvim',     -- Fancier statusline
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        local lualine = require("lualine")

        local code_companion_status = {
            processing = false,
            spinner_index = 1
        }

        local group = vim.api.nvim_create_augroup("CodeCompanionStatus", {
            clear = false,
        })

        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "CodeCompanionRequest*",
            group = group,
            callback = function(request)
                if request.match == "CodeCompanionRequestStarted" then
                    code_companion_status.processing = true
                elseif request.match == "CodeCompanionRequestFinished" then
                    code_companion_status.processing = false
                end
            end,
        })

        local function code_companion_status_update()
            if code_companion_status.processing then
                code_companion_status.spinner_index = (code_companion_status.spinner_index % spinner_count) + 1
                return spinner_table[code_companion_status.spinner_index]
            else
                return nil
            end
        end

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype', code_companion_status_update },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
