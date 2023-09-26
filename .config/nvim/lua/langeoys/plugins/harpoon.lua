return {
    'ThePrimeagen/harpoon',
    config = function()
        require("harpoon").setup({
            tabline = true,
            projects = {
                ["$HOME/dev/adventofcode-java/"] = {
                    term = {
                        cmds = {
                            "mvn clean verify -q"
                        }
                    }
                }
            }
        })

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local cmd = require("harpoon.cmd-ui")
        local tmux = require("harpoon.tmux")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon list" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon window" })
        vim.keymap.set("n", "<C-t>", cmd.toggle_quick_menu, { desc = "Toggle harpoon terminal window" })

        vim.keymap.set("n", "<A-j>", function() ui.nav_file(1) end, { desc = "Go to first harpooned file" })
        vim.keymap.set("n", "<A-k>", function() ui.nav_file(2) end, { desc = "Go to second harpooned file" })
        vim.keymap.set("n", "<A-l>", function() ui.nav_file(3) end, { desc = "Go to third harpooned file" })
        vim.keymap.set("n", "<A-;>", function() ui.nav_file(4) end, { desc = "Go to fourth harpooned file" })

        vim.keymap.set("n", "<A-J>", function() tmux.sendCommand(2, 1) end,
            { desc = "Send first harpoon command to tmux window 2" })
        vim.keymap.set("n", "<A-K>", function() tmux.sendCommand(2, 2) end,
            { desc = "Send second harpoon command to tmux window 2" })
        vim.keymap.set("n", "<A-L>", function() tmux.sendCommand(2, 3) end,
            { desc = "Send third harpoon command to tmux window 2" })

        vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#6e6a86')
        vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#F6C177')
        vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#EA9A97')
        vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#6E6A86')
        vim.cmd('highlight! TabLineFill guibg=NONE guifg=#F6C177')
    end
}
