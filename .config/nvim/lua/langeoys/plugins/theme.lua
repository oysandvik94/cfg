return {
    {
        "rose-pine/neovim",
        config = function()
            require('rose-pine').setup({
                variant = 'main',
            })

            -- Set colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "rebelot/kanagawa.nvim"}
}
