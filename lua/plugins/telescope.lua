return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pm", builtin.man_pages, { desc = "Fuzzy search man pages" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Fuzzy search files" })
		vim.keymap.set("n", "<leader>pcf", function()
		    builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Fuzzy search files in config" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Fuzzy search git files" })
		vim.keymap.set("n", "<leader>ps", function()
		    builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Search for string" })
		vim.keymap.set("n", "<leader>pds", builtin.lsp_document_symbols, { desc = "Fuzzy serch Document symbols" })
		vim.keymap.set("n", "<leader>pws", builtin.lsp_workspace_symbols, { desc = "Fuzzy serch Workspace symbols" })
		vim.keymap.set("n", "<leader>pr", builtin.lsp_references, { desc = "Fuzzy serch LSP references" })
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Fuzzy serch Help tags" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Fuzzy serch Vim buffers" })
	end
}
