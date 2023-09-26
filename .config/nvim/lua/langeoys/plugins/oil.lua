return {
    'stevearc/oil.nvim',
    config = function()
        require("oil").setup({
            columns = {
                "icon"
            },
            keymaps = {
                -- This binds are used by tmux navigator
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-r>"] = "actions.refresh",
            },
            view_options = {
                show_hidden = true
            }
        })
        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
}
