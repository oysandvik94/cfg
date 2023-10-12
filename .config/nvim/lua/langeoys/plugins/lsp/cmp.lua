-- extract to global util
local function tableContains(table, value)
    for i = 1, #table do
        if (table[i] == value) then
            return true
        end
    end
    return false
end

local menu = {
    buffer = "[buf]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[api]",
    path = "[path]",
    luasnip = "[snip]",
    copilot = "[copilot]",
    ['vim-dadbod-completion'] = '[DB]',
}
local parameterizedTypes = {
    2, 3, 4
}
local function formatLspFunctions(entry, vim_item)
    local source = entry.source.name
    local item = entry:get_completion_item()

    if entry.source.source.client.name ~= "jdtls" then
        vim_item.menu = menu[source]
        return vim_item
    end
    if tableContains(parameterizedTypes, item.kind) then
        vim_item.abbr = item.label ..
            item.labelDetails.detail
        if item.kind ~= 4 then
            vim_item.menu = item.labelDetails.description
        else
            vim_item.menu = menu[source]
        end
    end

    return vim_item
end

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' }, -- Required
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
        { 'onsails/lspkind.nvim' },
        { 'ray-x/lsp_signature.nvim' }
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require('lspkind')

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp_select_opts = { behavior = cmp.SelectBehavior.Insert }
        --
        -- key mappings for Alt+number to select, have to press enter after to confirm though
        local keys = {
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
            ["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
        }

        vim.opt.pumheight = 10
        -- local log = require('plenary.log').new {
        --     plugin = "cmp",
        --     level = "debug"
        -- }
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup({
            ---@diagnostic disable-next-line: missing-fields
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
            view = {
                entries = { name = 'custom', selection_order = 'near_cursor' }
            },
            sources = {
                { name = 'nvim_lsp', max_item_count = 20 },
                { name = 'nvim_luA' },
                { name = 'luasnip', },
                { name = "buffer",   keyword_length = 5 },
                { name = 'path' },
                -- { name = "copilot" }
            },
            mapping = keys,
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 40,
                    ellipsis_char = '...',
                    symbol_map = { Copilot = "" },
                    before = function(entry, vim_item)
                        local source = entry.source.name
                        if source == "nvim_lsp" then
                            vim_item = formatLspFunctions(entry, vim_item)
                            return vim_item
                        end

                        vim_item.menu = menu[source]

                        return vim_item
                    end
                })
            },

        })
        require("lspkind").init({
            symbol_map = {
                Copilot = "",
            },
        })

        vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

        -- Setup for cmdline
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        require 'lsp_signature'.setup({
            bind = true,  -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded"
            },
             hint_enable = true,
              hint_inline = function() return true end,
               hint_prefix = "",
               select_signature_key = "A-s"
        })

        -- set highlight LspSignatureActiveParameter
        -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#6CC644" })
        vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { ctermbg = 0, fg = '#31748F', bg = '#EBBCBA' })

        vim.keymap.set({ 'n' }, '<Leader>k', function()
            vim.lsp.buf.signature_help()
        end, { silent = true, noremap = true, desc = 'toggle signature' })
    end,
}
