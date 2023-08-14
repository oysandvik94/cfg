vim.o.shortmess = vim.o.shortmess .. "S"

local function search_count()
    local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })
    if res.total > 0 then
        return string.format("%s/%d %s", res.current, res.total, vim.fn.getreg('/'))
    end

    return ""
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'tokyonight',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename' },
                lualine_c = {},
                lualine_x = { 'diagnostics'},
                lualine_y = { { search_count, type = "lua_expr" } },
                lualine_z = { 'branch', 'diff' }
            },
        })
    end
}
