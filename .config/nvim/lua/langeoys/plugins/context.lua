return {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false, -- Trialing barbeque
    config = function()
        require("nvim-treesitter.configs").setup {
            context = {
                enable = true,
            }
        }
    end
}
