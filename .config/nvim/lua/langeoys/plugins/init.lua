return {
    { 'rose-pine/neovim', name = 'rose-pine' },
    'nvim-lua/plenary.nvim',
    "Hoffs/omnisharp-extended-lsp.nvim",
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
    "Decodetalkers/csharpls-extended-lsp.nvim",
}
