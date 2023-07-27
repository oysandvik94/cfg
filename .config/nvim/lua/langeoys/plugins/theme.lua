return {
    {
        'Shatur/neovim-ayu',
        lazy = false,
        config = function()
            require('ayu').setup({
                overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
            })

            vim.cmd('colorscheme ayu')
        end
    }
}
