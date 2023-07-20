local omnisharp = {}

function omnisharp.Setup()
    return {
        solution_first = true,
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').handler,
        },
        enable_editorconfig_support = true,
    }
end

return omnisharp
