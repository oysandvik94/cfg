-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    vim.cmd('colorscheme rose-pine')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                  -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                                         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },                                     -- Required
            { 'L3MON4D3/LuaSnip',                 dependencies = { "rafamadriz/friendly-snippets" } }, -- Required
        },

        use("nvim-treesitter/nvim-treesitter-context"),

        use { 'saadparwaiz1/cmp_luasnip' },

        use("tpope/vim-commentary"),
        use("lewis6991/gitsigns.nvim"),

        use({ "rafamadriz/friendly-snippets" }),
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        },
        use({
            "aserowy/tmux.nvim",
            config = function() return require("tmux").setup() end
        }),

        use("github/copilot.vim"),
        use("almo7aya/openingh.nvim"),
        use { 'Issafalcon/lsp-overloads.nvim' },

        use("nvim-telescope/telescope-fzy-native.nvim"),
        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        },
        -- Debugging
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "BufReadPre",
            module = { "dap" },
            wants = { "nvim-dap-ui", },
            requires = {
                { "rcarriga/nvim-dap-ui" },
                { "nvim-telescope/telescope-dap.nvim" },
            },
        }
    }
end)
