vim.o.shortmess = vim.o.shortmess .. "S"

local function search_count()
    local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })
    if res.total > 0 then
        return string.format("%s/%d %s", res.current, res.total, vim.fn.getreg('/'))
    end

    return ""
end

local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
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
                lualine_b = { 'filename',  },
                lualine_c = {},
                lualine_x = { 'diagnostics' },
                lualine_y = { { "macro-recording", fmt = show_macro_recording }, { search_count, type = "lua_expr" } }, -- Tmp objects
                lualine_z = { 'branch', 'diff' } -- git
            },
        })
    end
}
