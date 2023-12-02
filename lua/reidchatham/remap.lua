vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
-- vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', {noremap = true, silent = true})

-- move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- concatenate next line to end of current line
vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in place when half screen jumping up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- move cursor to middle of screen when searching with n/N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste from clipboard without overwriting default register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without overwriting the default register
vim.keymap.set({ "n", "v" }, "D", [["_d]])

-- map <C-c> to Esc in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- navigate next/previous buffers
vim.keymap.set({ "n", "v" }, "H", ":bp<Enter>")
vim.keymap.set({ "n", "v" }, "L", ":bn<Enter>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
