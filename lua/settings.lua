vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>", "")

-- Proper tabbing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line wrap
vim.opt.wrap = false

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Font
vim.opt.guifont = "Iosevka_Regular:14"
vim.g.have_nerd_font = true

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Termguicolors
vim.opt.termguicolors = true

-- transparent fold text (source: https://github.com/neovim/neovim/pull/20750)
vim.opt.foldtext = ""
vim.opt.fillchars = "fold: "

-- treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- errorformat for Odin
vim.opt.errorformat:append { "%f(%l:%c) %m" }

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end
})

-- Neovide Settings
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_cursor_trail_size = 0
