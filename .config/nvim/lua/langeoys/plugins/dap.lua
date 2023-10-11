return {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap_ui = require("dapui")
        local dap = require("dap")
        local jdtls = require("jdtls")
        dap_ui.setup({
            layouts = { {
                elements = { {
                    id = "watches",
                    size = 0.5
                }, {
                    id = "scopes",
                    size = 0.5
                } },
                position = "bottom",
                size = 10
            } },
        })
        require("nvim-dap-virtual-text").setup()

        local function trigger_dap(dapStart)
            dap_ui.open({ reset = true })
            dapStart()
        end

        local function continue()
            if (dap.session()) then
                dap.continue()
            else
                dap_ui.open({ reset = true })
                dap.continue()
            end
        end

        vim.keymap.set('n', '<Leader>dd', function() require('dap').toggle_breakpoint() end,
            { desc = "Toggle breakpoint" })

        vim.keymap.set('n', '<Leader>dD', function()
                vim.ui.input({ prompt = "Condition: " }, function(input)
                    dap.set_breakpoint(input)
                end)
            end,
            { desc = "Toggle breakpoint" })

        vim.keymap.set('n', '<leader>df', function() trigger_dap(require('jdtls').test_class()) end,
            { desc = "Debug test class" })
        vim.keymap.set('n', '<leader>dn', function() trigger_dap(require('jdtls').test_nearest_method()) end,
            { desc = "Debug neartest test method" })
        vim.keymap.set('n', '<leader>dt', function() trigger_dap(jdtls.test_nearest_method) end,
            { desc = 'Debug nearest test' });
        vim.keymap.set('n', '<leader>dT', function() trigger_dap(jdtls.test_class) end, { desc = 'Debug test class' });
        vim.keymap.set('n', '<leader>dp', function() trigger_dap(jdtls.pick_test) end, { desc = 'Choose nearest test' });
        vim.keymap.set('n', '<leader>dl', function() trigger_dap(dap.run_last) end, { desc = 'Choose nearest test' });
        vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'Step over' });
        vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'Step into' });
        vim.keymap.set('n', '<leader>du', function() dap.step_out() end, { desc = 'Step out' });
        vim.keymap.set('n', '<leader>db', function() dap.step_back() end, { desc = 'Step back' });
        vim.keymap.set('n', '<leader>dh', function() dap.run_to_cursor() end, { desc = 'Run to cursor' });
        vim.keymap.set('n', '<leader>dc', continue, { desc = 'Start debug session, or continue session' });
        vim.keymap.set('n', '<leader>de', function()
            dap.terminate()
            dap_ui.close()
        end, { desc = 'Terminate debug session' });
        vim.keymap.set('n', '<leader>du', function() dap_ui.toggle({ reset = true }) end,
            { desc = 'Reset and toggle ui' });

        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#1f1d2e', bg = '#f6c177' })
        vim.fn.sign_define('DapStopped', {
            text = '->',
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped'
        })

        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Debug (Attach) - Remote",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }
    end,
}