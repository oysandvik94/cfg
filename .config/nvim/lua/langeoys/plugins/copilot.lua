return {
    enabled = false,
    "zbirenbaum/copilot-cmp",
    dependencies = {
        "zbirenbaum/copilot.lua"
    },
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
        require("copilot_cmp").setup()
        vim.g.copilot_filetypes = {markdown = true}
    end
}
