return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'hrsh7th/cmp-path' },
        { 'L3MON4D3/LuaSnip' },     -- Required
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
        { 'onsails/lspkind.nvim' }
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require('lspkind')

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
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
                { name = 'nvim_lsp',               keyword_length = 3, max_item_count = 30 },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip',                keyword_length = 2 },
                { name = "buffer" },
                { name = 'path' }
            },
            mapping = {
                ["<C-K>"] = cmp.mapping.complete(),
                ['<C-p>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item(cmp_select_opts)
                    else
                        cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item(cmp_select_opts)
                    else
                        cmp.complete()
                    end
                end),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                ["<C-y>"] = cmp.mapping.confirm({ select = false }),
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
    end,
}
