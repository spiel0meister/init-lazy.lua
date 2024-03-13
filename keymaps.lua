vim.g.mapleader = " "
vim.keymap.set("n", "<leader>", "")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open explorer" })

-- Diagnostics
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open diagnostics Error Messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics Quick fixes" })
vim.keymap.set("n", "<leader>dgn", vim.diagnostic.goto_next, { desc = "Go to next diagnostics" })
vim.keymap.set("n", "<leader>dgp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostics" })

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git (vim-fugitive, probably)" })

-- Exotic motions
vim.keymap.set("n", "<leader>jb", "%", { desc = "Jump to next pair" })

-- Windows
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Don't have time to press Ctrl+w" })
vim.keymap.set("n", "<leader>sv", "<C-w><C-v>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>cw", "<C-w>c", { desc = "Close window but keep buffer" })
vim.keymap.set("n", "<leader>kw", "<C-w>o", { desc = "Close all but selected window" })
vim.keymap.set("n", "<leader>=w", "<C-w>=", { desc = "Re size windows to equal size" })

-- Saving
vim.keymap.set("n", "<leader>sf", "<CMD>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<CMD>w<CR>", { desc = "Save file in insert mode" })

-- Yanking and Pasting
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Set up yanking into clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank selection into clipboard" })

vim.keymap.set("n", "<leader>pp", "\"*p", { desc = "Paste clipboard" })

-- Formatting
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "Format file (with LSP)" })
vim.keymap.set("n", "<leader>rt", ">>", { desc = "Indent" })
vim.keymap.set("n", "<leader>lt", "<<", { desc = "Remove indent" })

