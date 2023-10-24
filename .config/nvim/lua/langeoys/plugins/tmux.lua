return {
    "oysandvik94/bspwm-nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
        local nvim_tmux_nav = require("nvim-tmux-navigation")
        nvim_tmux_nav.setup({
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
            },
        })

        require 'nvim-tmux-navigation'.setup {
            disable_when_zoomed = false -- defaults to false
        }
    end,
}
