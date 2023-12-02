return {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = {
        default_mappings = {
            ours = 'o',
            theirs = 't',
            none = '0',
            both = 'b',
            next = 'n',
            prev = 'p',
        },                               -- disable buffer local mapping created by this plugin
        default_commands = true,         -- disable commands created by this plugin
        disable_diagnostics = false,     -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = 'copen',           -- command or function to open the conflicts list
        highlights = {
            -- They must have background color, otherwise the default color will be used
            incoming = 'DiffAdd',
            current = 'DiffText',
        }
    }
}
