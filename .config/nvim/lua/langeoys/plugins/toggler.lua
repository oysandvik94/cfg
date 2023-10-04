return {
    "rmagatti/alternate-toggler",
    config = function()
        require("alternate-toggler").setup { }
        vim.keymap.set(
            "n",
            "<leader><space>", -- <space><space>
            "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
        )
    end
}
