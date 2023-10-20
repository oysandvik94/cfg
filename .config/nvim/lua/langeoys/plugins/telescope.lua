local theme_picker = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values

    opts = opts or {}

    local function next_color(bufnr)
        actions.move_selection_next(bufnr)
        local selected = action_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selected[1]
        vim.cmd(cmd)
    end

    local function prev_color(bufnr)
        actions.move_selection_previous(bufnr)
        local selected = action_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selected[1]
        vim.cmd(cmd)
    end

    pickers.new(opts, {
        finder = finders.new_table(vim.fn.getcompletion("", "color")),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(bufnr, map)
            actions.select_default:replace(function()
                actions.close(bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('colorscheme ' .. selection[1])
            end)

            map("i", "<C-j>", next_color)
            map("i", "<C-k>", prev_color)
            map("i", "<C-n>", next_color)
            map("i", "<C-p>", prev_color)

            return true
        end,
    }):find()
end

local dap_ui_picker = function(opts)
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values
    local dap_ui = require("dapui")

    opts = opts or {}

    pickers.new(opts, {
        finder = finders.new_table {
            results = { "scopes", "breakpoints", "stacks", "watches", "repl", "console" }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(bufnr)
            actions.select_default:replace(function()
                actions.close(bufnr)
                local selection = action_state.get_selected_entry()
                dap_ui.float_element(selection[1], { enter = true })
            end)

            return true
        end,
    }):find()
end

local function getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end

local function projectFiles()
    local opts = {} -- define here if you want to define something
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        require "telescope.builtin".git_files(opts)
    else
        require "telescope.builtin".find_files(opts)
    end
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzy-native.nvim',
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local opts = { noremap = true, silent = true }

        -- Extensions
        telescope.load_extension('fzy_native')

        -- Git files er litt irriterende på nye filer som ikke er added på git
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files(opts)
        end, opts)
        -- vim.keymap.set('n', '<leader>ff', function()
        --     projectFiles()
        -- end, opts)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('v', '<leader>fg', function()
            local text = getVisualSelection()
            builtin.live_grep({ default_text = text })
        end, opts)

        vim.keymap.set('n', '<leader>fsd', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>fsg', builtin.lsp_dynamic_workspace_symbols, {})
        vim.keymap.set('n', '<leader>fr', function()
            builtin.lsp_references({ jump_type = 'never' })
        end, {})
        -- Find diagnostics filtered by type
        vim.keymap.set('n', '<leader>fd', function()
            builtin.diagnostics({ severity_limit = 'WARN' });
        end)
        vim.keymap.set('n', '<leader>ft', vim.cmd.Telescope, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Search keymaps in telescope" })

        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)

        vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

        vim.keymap.set('n', '<leader>fd', dap_ui_picker, {})
        vim.keymap.set('n', '<leader>fc', theme_picker, {})
        vim.keymap.set('n', '<leader>fl', builtin.resume, {})

        local actions = require("telescope.actions")
        require('telescope').setup({
            defaults = {
                path_display = { "smart" },
                sorting_strategy = "ascending",
                layout_strategy = "center",
                border = false, -- kanskje
                prompt_title = "",
                results_title = "",
                preview_title = "",
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "",
                multi_icon = "",
                color_devicons = true,
                layout_config = {
                    anchor = "N",
                    width = 99
                },
                mappings = {
                    i = {
                        ["<C-e>"] = actions.close
                    },
                },
            }
        })
    end,
}
