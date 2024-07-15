local function setup_custom_snippets(ls)
    local extras = require("luasnip.extras")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local rep = extras.rep

    local fmt = require("luasnip.extras.fmt").fmt

    ls.add_snippets("c", {
        s("pf", fmt("printf(\"{}\", {}){}", {
            i(1),
            i(2),
            i(0)
        })),

        s("epf", fmt("fprintf(stderr, \"{}\", {}){}", {
            i(1),
            i(2),
            i(0)
        })),

        s("struct", fmt([[
        typedef struct {} {};
        struct {} {{
            {}
        }};{}
        ]],
        {
            rep(1),
            rep(1),
            i(1),
            i(2),
            i(0),
        }))
    })
end

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
        "onsails/lspkind.nvim",

        -- LuaSnip
        "L3MON4D3/LuaSnip",
        "L3MON4D3/cmp_luasnip",

        "lukas-reineke/lsp-format.nvim",
    },
    config = function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

        local lsp_zero = require("lsp-zero")
        local lsp_config = require("lspconfig")
        local lsp_format = require("lsp-format")
        local lspkind = require("lspkind")
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local function lsp_format_on_attach(client, bufnr)
            lsp_format.on_attach(client, bufnr)
        end

        lsp_zero.on_attach(function(_, bufnr)
            -- see :help lsp-zero-keybindings to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
            -- lsp_zero.buffer_autoformat()
        end)

        luasnip.setup({
            history = true,
            update_events = "TextChanged,TextChangedI",
            enable_autosnippets = true
        })
        setup_custom_snippets(luasnip)

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end)

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true })

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-j>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4)
            }),

            sources = {
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = "buffer", keyword_length = 5 },
            },

            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[api]",
                        luasnip = "[snippet]",
                        buffer = "[buffer]",
                        path = "[path]"
                    }
                })
            },

            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })

        lspkind.init({})

        require("mason").setup({})
        require("mason-lspconfig").setup({
            -- Replace the language servers listed here
            -- with the ones you want to install
            ensure_installed = { "rust_analyzer", "clangd", "lua_ls", "bashls" },
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
