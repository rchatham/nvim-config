return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {},  -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = {      -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes",
                    },
                    default_workspace = "notes",
                }
            }
        }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        { "folke/tokyonight.nvim", config = function(_, _) vim.cmd.colorscheme "rose-pine" end, },
    },
}
