local highlight_group = vim.api.nvim_create_augroup('TSHighlights', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.cmd.highlight('TelescopeNormal  guibg=#242936 ')
        vim.cmd.highlight('TelescopeSelection  guibg=#403d52, guifg=#6e6a86')

        -- local highlights = {
        --     'Normal',
        --     'LineNr',
        --     'Folded',
        --     'NonText',
        --     'SpecialKey',
        --     'VertSplit',
        --     'SignColumn',
        --     'EndOfBuffer',
        --     'TablineFill', -- this is specific to how I like my tabline to look like
        -- }
        -- for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end

        -- :h hl-CursorLineNr 
        -- vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
        vim.cmd.highlight("CursorLineNr guibg=none")

    end,
    group = highlight_group,
    pattern = '*',
})

require "langeoys.global"
require("langeoys")

local colorFile = vim.fn.stdpath('data') .. "/colorscheme"
local file = io.open(colorFile, "r")
if file then
    local colorscheme = file:read()
    if colorscheme then
        vim.cmd('colorscheme ' .. colorscheme)
    end
    file:close()
end

