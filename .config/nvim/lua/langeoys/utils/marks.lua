local M = {}

local globalMarks = {
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
    "X", "Y", "Z"
}

M.get_mark_list = function()
    local marks = {}
    for _, v in ipairs(globalMarks) do
        local mark = vim.api.nvim_get_mark(v, {})
        if mark[1] ~= 0 then
            marks[v] = vim.fn.expand(mark[4])
        end
    end

    local option_labels = {}
    for key, _ in pairs(marks) do
        table.insert(option_labels, key)
    end

    vim.ui.select(option_labels, {
        prompt = "Select mark",
        format_item = function(item)
            local formatted_label = item .. " - " .. marks[item]
            return formatted_label
        end,
    }, function(mark)
        if mark then
            vim.cmd("normal! '" .. mark)
        end
    end)
end

M.clear_global_marks = function()
    for _, v in ipairs(globalMarks) do
        vim.api.nvim_del_mark(v)
    end
end


return M
