-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Backup stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colors?
vim.opt.termguicolors = true

-- Scrollstuff
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes:2"
vim.opt.isfname:append("@-@")


-- Performance
vim.opt.updatetime = 50


vim.g.mapleader = " "

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Cmdheight 0
vim.opt.cmdheight = 0

-- Automatically update files when changed outside of vim
vim.cmd([[set autoread]])
vim.cmd([[autocmd FocusGained * checktime]])

-- Spelling
vim.cmd([[setlocal spell]])
vim.opt.spelllang = "en_gb"
