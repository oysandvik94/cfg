return {
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
				-- calling `setup` is optional for customization
				require("fzf-lua").setup({
						winopts = {
								split = "belowright new",
								preview = {
										layout = "vertical",
										vertical = "up",
								},
						},
						keymap = {
								builtin = {
										["<C-d>"] = "preview-page-down",
										["<C-u>"] = "preview-page-up",
								},
						},
				})
				vim.keymap.set("n", "<leader>/", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>ft", "<cmd>lua require('fzf-lua').tags()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep_glob()<CR>", { silent = true })
				vim.keymap.set("v", "<leader>fg", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>fx", "<cmd>lua require('fzf-lua').tmux_buffers()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>fl", "<cmd>lua require('fzf-lua').resume()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>fz", "<cmd>lua require('fzf-lua').builtin()<CR>", { silent = true })
				vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", { silent = true })
		end,
}
