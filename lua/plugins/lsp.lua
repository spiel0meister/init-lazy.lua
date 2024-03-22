return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- LSP Support
        "neovim/nvim-lspconfig",
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "lukas-reineke/lsp-format.nvim"
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local lsp_config = require("lspconfig")
        local lsp_format = require("lsp-format")
        local cmp = require("cmp")

        local function lsp_format_on_attach(client, bufnr)
            lsp_format.on_attach(client, bufnr)
        end

        lsp_zero.on_attach(function(_, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
            -- lsp_zero.buffer_autoformat()
        end)

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.confirm({ select = true })
            })
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            -- Replace the language servers listed here
            -- with the ones you want to install
            ensure_installed = { "tsserver", "rust_analyzer", "pyright", "clangd", "lua_ls", "asm_lsp", "neocmake", "html", "bashls", "cssls" },
            handlers = {
                function(server)
                    if server ~= "clangd" then
                        lsp_config[server].setup({ on_attach = lsp_format_on_attach })
                    else
                        lsp_config[server].setup({})
                    end
                end,
                biome = lsp_zero.noop,
                lua_ls = function()
                    lsp_config.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end
            }
        })
    end
}
