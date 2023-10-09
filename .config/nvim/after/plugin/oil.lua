vim.keymap.set(
    "n",
    "<leader>pv",
    vim.cmd.Oil,
    { desc = "file navigation" }
)

require("oil").setup({
    keymaps = {
        ["<leader>pv"] = "actions.close",
        ["<Esc>"] = "actions.close"
    }
})
