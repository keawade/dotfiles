local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Map basic harpoon functions
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

-- TODO: Might want to come back and set some explicit bindings
-- Disabled for now because the suggested keymaps conflicted with something
-- else I wanted bound to <C-h>
--vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
--vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
--vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
--vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

