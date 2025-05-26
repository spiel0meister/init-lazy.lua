-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open explorer" }) -- Replaced by oil.nvim

-- Disable arrow keys
vim.keymap.set("", "<Left>", "<Nop>")
vim.keymap.set("", "<Right>", "<Nop>")
vim.keymap.set("", "<Up>", "<Nop>")
vim.keymap.set("", "<Down>", "<Nop>")

-- Easier run :make
vim.keymap.set("n", "<leader>r", "<CMD>mak<CR>", { desc = "Run :make" })

-- Eval lua
vim.keymap.set("n", "<leader>x", "<CMD>source %<CR>", { desc = "Source the current file" })
vim.keymap.set("v", "<leader>x", "<CMD>lua<CR>", { desc = "Run the selected lua code" })

-- Quickfix
vim.keymap.set("n", "<M-o>", "<CMD>cope<CR>", { desc = "Open the quickfix list" })
vim.keymap.set("n", "<M-c>", "<CMD>cclose<CR>", { desc = "Close the quickfix list" })
vim.keymap.set("n", "<M-n>", "<CMD>cnext<CR>", { desc = "Go to the next quickfix entry" })
vim.keymap.set("n", "<M-p>", "<CMD>cprev<CR>", { desc = "Go to the previous quickfix entry" })

-- Diagnostics
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open diagnostics Error Messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics Quick fixes" })
vim.keymap.set("n", "<leader>dgn", vim.diagnostic.goto_next, { desc = "Go to next diagnostics" })
vim.keymap.set("n", "<leader>dgp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostics" })

-- Saving
vim.keymap.set("n", "<leader>sf", "<CMD>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<CMD>w<CR>", { desc = "Save file in insert mode" })

-- Yanking and Pasting
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Set up yanking into clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank selection into clipboard" })

vim.keymap.set("n", "<leader>pp", "\"*p", { desc = "Paste clipboard" })
vim.keymap.set("v", "<leader>p", "\"*p", { desc = "Paste clipboard" })

-- Formatting
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format()
end, { desc = "Format file (with LSP)" })

-- Folding
vim.keymap.set("n", "<leader>fo", "zo", { desc = "Open fold" })
vim.keymap.set("n", "<leader>fc", "zc", { desc = "Close fold" })
vim.keymap.set("n", "<leader>ff", "za", { desc = "Toggle fold" })

-- Move line
vim.keymap.set("n", "<A-k>", "ddkkp", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", "ddp", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv", { desc = "Move line up (selection)" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv", { desc = "Move line down (selection)" })

-- The MIT License
vim.keymap.set("n", "<leader>MIT", [[i
Copyright 2025 Žan Sovič <soviczan7@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
<ESC>]])

-- Dashes
vim.keymap.set("n", "<leader>DD", "i------------------------<ESC>")
