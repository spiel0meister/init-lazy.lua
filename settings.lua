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
vim.opt.guifont = "JetBrainsMono Nerd Font:14"

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Termguicolors
vim.opt.termguicolors = true

-- transparent fold text (source: https://github.com/neovim/neovim/pull/20750)
vim.opt.foldtext = ""
vim.opt.fillchars = "fold: "

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
