local file_name_formatter = function(opts)
    local devicons = require("nvim-web-devicons")

    local entry_display = require("telescope.pickers.entry_display")
    opts = opts or {}
    local default_icons, _ = devicons.get_icon("file", "", { default = true })

    local displayer = entry_display.create({
        separator = " ",
        items = {
            { width = vim.fn.strwidth(default_icons) },
            { remaining = true },
            { remaining = true },
        },
    })

    local make_display = function(entry)
        vim.cmd('highlight! @ibl.indent.char.2 guibg=NONE guifg=#E0DEF4')
        vim.cmd('highlight! @ibl.indent.char.1 guibg=NONE guifg=#6e6a86')
        vim.cmd('highlight! TelescopeSelection guibg=#403d52 guifg=#6e6a86')
        return displayer({
            { entry.devicons,   entry.devicons_highlight },
            {entry.file_name, "@ibl.indent.char.2" },
            { entry.grayed_out, "@ibl.indent.char.1" },
        })
    end

    return function(entry)
        local grayed_out

        if entry:find("/") == nil then
            grayed_out = vim.fn.fnamemodify(entry, ":p:h") -- Path from root
        else
            grayed_out = entry:gsub("/[^/]*$", "")         -- Path without filename
        end

        local file_name = vim.fn.fnamemodify(entry, ":p:t")

        local icons, highlight = devicons.get_icon(entry, string.match(entry, "%a+$"), { default = true })

        return {
            valid = true,
            value = entry,
            ordinal = entry,
            display = make_display,
            devicons = icons,
            devicons_highlight = highlight,
            file_name = file_name,
            grayed_out = grayed_out,
        }
    end
end

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
        local keymap_opts = { noremap = true, silent = true }

        -- Extensions
        telescope.load_extension('fzy_native')

        vim.keymap.set("n", "<leader>ff", function()
            local opts = {
                entry_maker = file_name_formatter(),
                show_untracked = true,
            }

                builtin.find_files(opts)
            -- local succ = pcall(builtin.git_files, opts)
            --
            -- if not succ then
            -- end
        end, { desc = "Fuzzy find files in project" })

        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('v', '<leader>fg', function()
            local text = getVisualSelection()
            builtin.live_grep({ default_text = text })
        end, keymap_opts)

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
