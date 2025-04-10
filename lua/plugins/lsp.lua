return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",

        "lukas-reineke/lsp-format.nvim",
    },
    config = function()
        vim.diagnostic.config({ virtual_text = true })
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

        local lsp_zero = require("lsp-zero")
        local lsp_config = require("lspconfig")
        local lsp_format = require("lsp-format")
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                if client:supports_method('textDocument/completion') then
                    -- Optional: trigger autocompletion on EVERY keypress. May be slow!
                    -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                    -- client.server_capabilities.completionProvider.triggerCharacters = chars

                    vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
                end
            end
        })

        lspkind.init({})

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "rust_analyzer", "clangd", "lua_ls" },
            handlers = {
                function(name)
                    lsp_config[name].setup({})
                end,
                clangd = function()
                    lsp_config.clangd.setup({
                        filetypes = { 'c', 'cpp', 'h', 'hpp' },
                    })
                end,
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
                end,
            }
        })
    end
}
