vim.g.mapleader = " "

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
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Back and forths
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]t", "<cmd>tabnext<CR>")
vim.keymap.set("n", "[t", "<cmd>tabprev<CR>")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Splits
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>")

-- Insert semicolon
vim.keymap.set("i", "<C-]>", "<esc>A;<esc>", { noremap = true, silent = true })

-- Spellcheck
vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
