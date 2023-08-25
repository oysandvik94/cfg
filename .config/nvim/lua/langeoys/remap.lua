vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines with V and J in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor at start of line when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle when paging
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Dont replace register when wasting over selection
vim.keymap.set("x", "<leader>p", "p")
vim.keymap.set("x", "p", [["_dP]])

-- Copy to system clipboard with leader y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without putting in to register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Remove Q, macro thing
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
vim.keymap.set("n", "<leader>qk", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>qj", "<cmd>cprev<CR>zz")

-- Search and replace all hits
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Debugger
vim.keymap.set("n","<F5>", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n","<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n","<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n","<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n","<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n","<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n","<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n","<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n","<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>')

-- Splits
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>")

