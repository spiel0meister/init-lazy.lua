return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    run = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "nasm", "asm" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>nis", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>nsi",
                    scope_incremental = "<leader>ssi",
                    node_decremental = "<leader>nsd",
                },
            },

            textobject = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["if"] = "@function.inner",
                        ["af"] = "@function.outer",
                        ["ic"] = "@class.inner",
                        ["ac"] = "@class.outer",
                        ["ia"] = "@parameter.inner",
                        ["aa"] = "@parameter.outer",
                        ["il"] = "@loop.inner",
                        ["al"] = "@loop.outer",
                    }
                },
                -- Modes:
                --  - v - charwise
                --  - V - linewise
                --  - <c-v> - blockwise
                selection_modes = {
                    ['@parameter.*'] = 'v',
                    ['@function.*'] = 'V',
                    ['@class.*'] = 'V',
                },
            }
        })
    end
}
