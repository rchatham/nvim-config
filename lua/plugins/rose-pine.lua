return {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- requires = { {'echasnovski/mini.nvim'} },
    config = function()
        -- Requires `rose-pine/neovim` and `echasnovski/mini.colors`
        vim.cmd('colorscheme rose-pine')
        require("mini.colors").get_colorscheme():add_cterm_attributes():apply()
        vim.opt.termguicolors = false
    end
}
