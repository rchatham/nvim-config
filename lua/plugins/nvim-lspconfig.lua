return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        -- (Optional) Configure lua language server for neovim
        local lua_opts = lsp_zero.nvim_lua_ls()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup(lua_opts)
        local util = require("lspconfig.util")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show line diagnostics"
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end

        lspconfig["sourcekit"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
            },
            root_dir = function(filename, _)
                return util.root_pattern("buildServer.json")(filename)
                    or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
                    or util.find_git_ancestor(filename)
                    or util.root_pattern("Package.swift")(filename)
            end,
        })
    end,
}
