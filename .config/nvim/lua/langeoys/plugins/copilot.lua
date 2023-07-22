return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            ["java"] = false
        }
    end
}
