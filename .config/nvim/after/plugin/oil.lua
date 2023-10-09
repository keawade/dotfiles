vim.keymap.set(
    "n",
    "<leader>pv",
    vim.cmd.Oil,
    { desc = "[oil] file navigation" }
)

require("oil").setup({
    keymaps = {
        ["<leader>pv"] = "actions.close",
        ["<Esc>"] = "actions.close"
        -- <C-c> works by default
    }
})
