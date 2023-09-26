return {
    "williamboman/mason.nvim",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" }
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "eslint",
                "omnisharp",
                "lua_ls",
                "jdtls",
                "bashls",
                "kotlin_language_server",
                "pyright"
            },

            automatic_installation = true
        })
    end
}
