return {
    "alexghergh/nvim-tmux-navigation",
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

        vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
        vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
        vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
        vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

        require 'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true -- defaults to false
        }
    end,
}
