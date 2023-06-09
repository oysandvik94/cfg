local function getVisualSelection()
    vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

return {
    'nvim-telescope/telescope.nvim',
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

        local opts = { noremap = true, silent = true }
        vim.keymap.set('v', '<leader>fg', function()
            local text = getVisualSelection()
            builtin.live_grep({ default_text = text })
        end, opts)

        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fsd', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>fsg', builtin.lsp_dynamic_workspace_symbols, {})
        -- Find diagnostics filtered by type
        vim.keymap.set('n', '<leader>fd', function()
            builtin.diagnostics({ severity_limit = 'WARN' });
        end)
        vim.keymap.set('n', '<leader>ft', vim.cmd.Telescope, {})

        vim.keymap.set('n', '<leader>lrr', builtin.lsp_references, {})

        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)

        require('telescope').load_extension('fzy_native')
        require('telescope').load_extension('dap')
        -- open file_browser with the path of the current buffer
        vim.api.nvim_set_keymap(
            "n",
            "<space>fb",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { noremap = true }
        )
    end,
}

