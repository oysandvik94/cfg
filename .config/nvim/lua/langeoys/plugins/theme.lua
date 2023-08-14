return {
    {
        'catppuccin/nvim',
        lazy = false,
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd('colorscheme tokyonight-night')
        end
    }
}
