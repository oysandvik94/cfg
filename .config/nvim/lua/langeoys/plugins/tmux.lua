return {
    "aserowy/tmux.nvim",
    config = function()
        require("tmux").setup({
            resize = {
                -- Setting this to trues sets alt+jk to resize, but I am using these for harpoon shortcuts
                enable_default_keybindings = false,
            }
        })
    end,
}
