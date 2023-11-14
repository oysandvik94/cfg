local M = {}

local globalMarks = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
}

M.get_mark_table = function()
	local marks = {}
	for _, v in ipairs(globalMarks) do
		local mark = vim.api.nvim_get_mark(v, {})
		if mark[1] ~= 0 then
			marks[v] = mark
		end
	end

	return marks
end

M.get_mark_list = function()
	local marks = M.get_mark_table()

	local option_labels = {}
	for key, _ in pairs(marks) do
		table.insert(option_labels, key)
	end

	vim.ui.select(option_labels, {
		prompt = "Select mark",
		format_item = function(item)
			local formatted_label = item .. " - " .. marks[item][4]
			return formatted_label
		end,
	}, function(mark)
		if mark then
			vim.cmd("normal! '" .. mark)
		end
	end)
end

M.set_global_marks = function(marks)
	local bufnr = vim.api.nvim_create_buf(false, true)
	for k, v in pairs(marks) do
        local filename = vim.fn.expand(v[4])
        print("fiol")
        P(filename)
        filename = "/home/oysandvik/dev/spring-chat.git/main/backend/pom.xml"
        filename = vim.fn.expand(filename)
		vim.api.nvim_buf_set_name(bufnr, filename)
		vim.api.nvim_buf_set_mark(bufnr, k, v[1], v[2], {})
	end
	vim.cmd("bd " .. bufnr)
end

M.clear_global_marks = function()
	for _, v in ipairs(globalMarks) do
		vim.api.nvim_del_mark(v)
	end
end

-- M.set_global_marks({
-- 	R = { 1, 0, 0, "/home/oysandvik/.config/nvim/lua/langeoys/plugins/telescope.lua" },
-- })
-- M.set_global_marks({
-- 	W = { 1, 0, 0, "/home/oysandvik/.config/nvim/lua/langeoys/plugins/dadbod.lua" },
-- })
-- --
-- P(vim.api.nvim_list_bufs())
-- P(vim.api.nvim_get_mark("R", {}))
-- P(vim.api.nvim_list_bufs())
return M
