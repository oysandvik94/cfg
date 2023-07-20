local keymaps = {}

function keymaps.Setup(opts)
    vim.keymap.set("n", "<A-s>", ":LspOverloadsSignature<CR>", { noremap = true, silent = true })
    vim.keymap.set("i", "<A-s>", "<cmd>LspOverloadsSignature<CR>", { noremap = true, silent = true })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "ge", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "gE", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- LSP Telescope bindings
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>lrr', builtin.lsp_references, {})

    vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end

return keymaps
