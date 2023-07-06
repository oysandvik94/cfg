return {

    -- {
    --     'nvim-telescope/telescope.nvim',
    --     tag = '0.1.2',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },

    { 'rose-pine/neovim', name = 'rose-pine' },

    'nvim-treesitter/playground',
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    "Hoffs/omnisharp-extended-lsp.nvim",

    {
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
        }
    },
    'saadparwaiz1/cmp_luasnip',

    "tpope/vim-commentary",
    "lewis6991/gitsigns.nvim",

    "rafamadriz/friendly-snippets",
    "windwp/nvim-autopairs",
    "tpope/vim-surround",
    "github/copilot.vim",
    "almo7aya/openingh.nvim",
    'Issafalcon/lsp-overloads.nvim',

    "nvim-telescope/telescope-fzy-native.nvim",
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        event = "BufReadPre",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "nvim-telescope/telescope-dap.nvim" },
        },
    },

    "j-hui/fidget.nvim",

    "oysandvik94/boilercreate.nvim",
    "Decodetalkers/csharpls-extended-lsp.nvim",
    'stevearc/oil.nvim'
}
