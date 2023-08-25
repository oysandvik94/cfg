return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                normal = "sa",
                delete = "sd",
                change = "sc"
            }
            -- Configuration here, or leave empty to use defaults
        })
    end
}
