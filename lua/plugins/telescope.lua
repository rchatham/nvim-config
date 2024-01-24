-- {{{ keymaps

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- ------------------------------------------------------------------------- }}}
-- {{{ lazy.nvim specification.

return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    cmd = "Telescope",

    keys = false,

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
