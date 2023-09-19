return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { noremap = true, silent = true }
                vim.keymap.set("n", "<A-s>", ":LspOverloadsSignature<CR>", { noremap = true, silent = true })
                vim.keymap.set("i", "<A-s>", "<cmd>LspOverloadsSignature<CR>", { noremap = true, silent = true })

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)

                local ls = require("luasnip")
                vim.keymap.set({"i", "s"}, "<C-f>", function() ls.jump( 1) end, {silent = true})
                vim.keymap.set({"i", "s"}, "<C-b>", function() ls.jump(-1) end, {silent = true})

                -- LSP Telescope bindings
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>gr', function()
                    builtin.lsp_references({ jump_type = 'never' })
                end, {})

                vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
            end
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local handlers = {
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    -- capabilities = capabilities,
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
                        },
                    },
                }
            end,
            ["jdtls"] = function()
                -- no-op, configured in nvim-jdtls plugin
            end
        }

        require('mason-lspconfig').setup_handlers(handlers)

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
