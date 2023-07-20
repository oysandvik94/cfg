return {
    { 'rose-pine/neovim', name = 'rose-pine' },
    'nvim-lua/plenary.nvim',
    "Hoffs/omnisharp-extended-lsp.nvim",
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",
    "github/copilot.vim",
    "almo7aya/openingh.nvim",
    'Issafalcon/lsp-overloads.nvim',
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        event = "BufReadPre",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "nvim-telescope/telescope-dap.nvim" },
        },
    },

    "oysandvik94/boilercreate.nvim",
    -- {dir = "~/dev/boilercreate"},
    "Decodetalkers/csharpls-extended-lsp.nvim",
}
