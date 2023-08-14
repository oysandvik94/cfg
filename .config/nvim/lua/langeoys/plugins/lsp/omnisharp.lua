local omnisharp = {}


function omnisharp.Setup()
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'cs' },
        desc = 'Set dotnet compiler',
        callback = function()
            vim.cmd("compiler dotnet")
        end,
    })

    return {
        solution_first = true,
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').handler,
        },
        enable_editorconfig_support = true,
        root_dir = require('lspconfig.util').root_pattern("*.sln")
    }
end

return omnisharp
