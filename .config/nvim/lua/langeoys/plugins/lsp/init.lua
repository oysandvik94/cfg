return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { 'onsails/lspkind.nvim' }
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.ensure_installed({
            "tsserver",
            "eslint",
            "omnisharp",
            "lua_ls",
            "jdtls"
        })

        local lspconfig = require("lspconfig");

        lsp.configure('omnisharp', require('langeoys.plugins.lsp.omnisharp').Setup())

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            require("langeoys.plugins.lsp.keymaps").Setup(opts)

            if client.server_capabilities.signatureHelpProvider then
                require('lsp-overloads').setup(client, {})
            end
        end)

        -- Setup is done by jdtls.nvim plugin
        lsp.skip_server_setup({ 'jdtls' })

        -- Fix Undefined global 'vim'
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls());

        local luasnip = require 'luasnip'
        luasnip.config.setup {}

        lsp.setup()

        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()
        local cmp_action = require('lsp-zero').cmp_action()
        local lspkind = require('lspkind')

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = 'nvim_lsp', keyword_length = 3, max_item_count = 30 },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip',                keyword_length = 2 },
            },
            mapping = {
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                ["<C-K>"] = cmp.mapping.complete(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    before = function(_, vim_item)
                        return vim_item
                    end
                })
            }
        })

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
