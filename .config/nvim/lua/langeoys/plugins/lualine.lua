return {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'iceberg_dark',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'branch', 'diff', 'diagnostics' }
            },
        })
    end
}
