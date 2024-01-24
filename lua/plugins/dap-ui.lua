return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", },
    lazy = true,
    -- stylua: ignore
    keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
    },
    opts = {},
    config = function(_, opts)
        -- setup dap config by VsCode launch.json file
        -- require("dap.ext.vscode").load_launchjs()
        require("dapui").setup({
            controls = {
                element = "repl",
                enabled = true,
            },
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            icons = { collapsed = "", expanded = "", current_frame = "" },
            layouts = {
                {
                    elements = {
                        { id = "stacks",      size = 0.25 },
                        { id = "scopes",      size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "watches",     size = 0.25 },
                    },
                    position = "left",
                    size = 60,
                },
                {
                    elements = {
                        { id = "repl", size = 1.0 },
                        -- { id = "console", size = 0.5 },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
        })

        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end
    end,
}
