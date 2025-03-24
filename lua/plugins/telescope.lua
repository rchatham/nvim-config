-- {{{ lazy.nvim specification.
return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    cmd = "Telescope",
    -- Change this to set keys inside the config
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
    opts = function(_, opts)
        local actions = require("telescope.actions")
        opts.defaults = {
            layout_config = { prompt_position = "bottom" },
            layout_strategy = "horizontal",
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            },
            prompt_prefix = " ",
            selection_caret = " ",
            --sorting_strategy = "ascending",
            winblend = 0,
        }
        opts.pickers = {
            colorscheme = { enable_preview = true },
        }
    end,

    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-lua/plenary.nvim",
    },
}

-- ------------------------------------------------------------------------- }}}
