return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "folke/neodev.nvim",
    },
    config = function()
        -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
        require("neodev").setup({
            -- add any options here, or leave empty to use the default settings
        })

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { noremap = true, silent = true }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "<leader>lh", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)

              
                -- LSP Telescope bindings
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>gr', function()
                    builtin.lsp_references({ jump_type = 'never' })
                end, {})

                -- vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
                --     vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                -- end, opts)
            end
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local handlers = {
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                }
            end,
            ["angularls"] = function()
                require("lspconfig").angularls.setup {
                    capabilities = capabilities,
                    on_attach = function()
                        vim.cmd [[compiler angular]]
                    end
                }
            end,
            ["omnisharp"] = function()
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = { 'cs' },
                    desc = 'Set dotnet compiler',
                    callback = function()
                        vim.cmd("compiler dotnet")
                    end,
                })

                require("lspconfig").omnisharp.setup {
                    capabilities = capabilities,
                    settings = {
                        solution_first = true,
                        handlers = {
                            ["textDocument/definition"] = require('omnisharp_extended').handler,
                        },
                        enable_editorconfig_support = true,
                        root_dir = require('lspconfig.util').root_pattern("*.sln")
                    }
                }
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                maxPreload = 10000,      -- Add this if missing or increase it
                                preloadFileSize = 10000, -- Add this if missing or increase it
                            },
                        },
                    },
                }
            end,
            ["jdtls"] = function()
                -- no-op, configured in nvim-jdtls plugin
            end
        }

        local mason = require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "eslint",
                "omnisharp",
                "lua_ls",
                "jdtls",
                "bashls",
                "kotlin_language_server",
                "pyright",
                "clangd"
            },

            automatic_installation = true
        })
        mason_lspconfig.setup_handlers(handlers)

        -- Configure diagnostics
        local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        local config = {
            -- Using lsp_lines.nvim
            virtual_text = false,
            -- show signs
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        }
        vim.diagnostic.config(config)
    end
}
