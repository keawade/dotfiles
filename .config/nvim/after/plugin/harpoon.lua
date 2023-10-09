local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "[harpoon] add file"})
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {desc = "[harpoon] open list"})

vim.keymap.set("n", "<A-j>", function() ui.nav_file(1) end, { desc = "[harpoon] file 1" })
vim.keymap.set("n", "<A-k>", function() ui.nav_file(2) end, { desc = "[harpoon] file 2" })
vim.keymap.set("n", "<A-l>", function() ui.nav_file(3) end, { desc = "[harpoon] file 3" })
vim.keymap.set("n", "<A-;>", function() ui.nav_file(4) end, { desc = "[harpoon] file 4" })
