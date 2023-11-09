return {
    'mvllow/modes.nvim',
    enabled=false,
    config = function()
        require('modes').setup({
            line_opacity = 0.15
        })
    end

}
