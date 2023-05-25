vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)

-- Allow selecting multiple lines and moving them up and down and automatically
-- handling indentation changes for blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Append next line to current line with a space but leave your cursor in the
-- same place instead of going to the right
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor in the middle while half page jumping so it isn't as
-- disorienting when you move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep search terms in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When pasting over top of selection, delete selection into the void buffer
-- so you don't loose your current paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Enable yanking into system clipboard separately from internal vim
-- Credit: asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Q is the worst place in the universe
vim.keymap.set("n", "Q", "<nop>")

-- Switch tmux sessions quickly
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Apply formatting
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- Quick fix list stuff (?)
-- Didn't catch what this was for and it conflicts with pane navigation I want
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Open search menu ready to replace the word I was on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Save with +x on file
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Quickly reload vim config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

