return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

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
        local luasnip = require("luasnip")
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

                    vim.lsp.completion.enable(true, client.id, args.buf)
                end
            end
        })

        lspkind.init({})

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50, -- actual suggestion item
                    },
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                })
            },
            snippet = {
                exapand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = "lazydev", group_index = 0 }
            })
        })

        local capabilites = require("cmp_nvim_lsp").default_capabilities()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "rust_analyzer", "clangd", "lua_ls" },
            handlers = {
                function(name)
                    lsp_config[name].setup({
                        root_markers = { ".git" },
                        capabilites = capabilites,
                    })
                end,
                ols = function()
                    lsp_config.ols.setup({
                        root_markers = { "ols.json", "odinfmt.json", ".git", "src" },
                    })
                end,
                zls = function()
                    lsp_config.zls.setup({
                        root_markers = { "build.zig", ".git", "src" },
                    })
                end,
                clangd = function()
                    lsp_config.clangd.setup({
                        root_markers = { ".clangd", ".git", "src" },
                        filetypes = { 'c', 'cpp', 'h', 'hpp' },
                        capabilites = capabilites,
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
                        },
                        capabilites = capabilites,
                    })
                end,
            }
        })
    end
}
