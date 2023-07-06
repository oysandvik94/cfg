local lsp = require('lsp-zero').preset({})


lsp.ensure_installed({
    "tsserver",
    "eslint",
    "omnisharp",
    "lua_ls"
})

-- lsp.configure('csharp_ls', {
--     handlers = {
--         ["textDocument/definition"] = require('csharpls_extended').handler,
--     },
--     csharp = {
--         solution = "/home/ysteinlangelandsandvik/dev/axos/axos/backend/api/axos.sln"
--     }
-- })

lsp.configure('omnisharp', {
    solution_first = true,
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    -- for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,
    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    -- enable_ms_build_load_projects_on_demand = false,
    -- Enables support for roslyn analyzers, code fixes and rulesets.
    -- enable_roslyn_analyzers = false,
    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    -- organize_imports_on_format = true,
    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    -- enable_import_completion = false,
    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    -- sdk_include_prereleases = true,
    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    -- analyze_open_documents_only = true,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {})
    end

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
    -- vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

-- Fix Undefined global 'vim'
local lspconfig = require("lspconfig");
lspconfig.lua_ls.setup(lsp.nvim_lua_ls());

-- lsp.configure('csharp_ls', {
--     root_dir = function(startpath)
--         return lspconfig.util.root_pattern("*.sln")(startpath)
--             or lspconfig.util.root_pattern("*.csproj")(startpath)
--             or lspconfig.util.root_pattern("*.fsproj")(startpath)
--             or lspconfig.util.root_pattern(".git")(startpath)
--     end,

-- })
local luasnip = require 'luasnip'
luasnip.config.setup {}

lsp.setup()

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp_action = require('lsp-zero').cmp_action()

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
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ["<C-K>"] = cmp.mapping.complete(),
    }
})

-- Configure diagnostics
local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
local config = {
    -- Enable virtual text
    virtual_text = true,
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
