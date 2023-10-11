return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
keys = {
    {"<leader>nt", "<cmd>NvimTreeToggle<cr>"},
    {"<leader>nf", "<cmd>NvimTreeFindFile<cr>"},
},
}
