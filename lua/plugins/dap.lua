--vim.keymap.set({'n', 'v'}, '<leader>db',  function() require("dap").toggle_breakpoint() end)

return {
    "mfussenegger/nvim-dap",

    dependencies = {

        -- fancy UI for the debugger
        { "rcarriga/nvim-dap-ui" },

        -- virtual text for the debugger
        { "theHamsta/nvim-dap-virtual-text", opts = {} },

        -- mason.nvim integration
        { "jay-babu/mason-nvim-dap.nvim" },
        { 'mfussenegger/nvim-dap-python' },
        { "wojciech-kulik/xcodebuild.nvim" },
    },

    config = function()
        local dap = require("dap")
        local xcodebuild = require("xcodebuild.dap")
     
        dap.configurations.swift = {
          {
            name = "iOS App Debugger",
            type = "codelldb",
            request = "attach",
            program = xcodebuild.get_program_path,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            waitFor = true,
          },
        }
     
        dap.adapters.codelldb = {
          type = "server",
          port = "13000",
          executable = {
            -- TODO: make sure to set path to your codelldb
            command = os.getenv("HOME") .. "/Downloads/codelldb-aarch64-darwin/extension/adapter/codelldb",
            args = {
              "--port",
              "13000",
              "--liblldb",
              -- TODO: make sure that this path is correct on your machine
              "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
            },
          },
        }
     
        -- nice breakpoint icons
        local define = vim.fn.sign_define
        define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
        define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
        define("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "", numhl = "" })
        define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
        define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
     
        -- integration with xcodebuild.nvim
        vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
        vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
     
        vim.keymap.set("n", "<leader>dc", dap.continue)
        vim.keymap.set("n", "<leader>dC", dap.run_to_cursor)
        vim.keymap.set("n", "<leader>dO", dap.step_over)
        vim.keymap.set("n", "<leader>di", dap.step_into)
        vim.keymap.set("n", "<leader>do", dap.step_out)
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>dB", function()
          dap.set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
        end)
        vim.keymap.set("n", "<Leader>dx", function()
          dap.terminate()
          require("xcodebuild.actions").cancel()
     
          local success, dapui = pcall(require, "dapui")
          if success then
            dapui.close()
          end
        end)
    end,
}
