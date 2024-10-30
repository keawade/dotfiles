vim.keymap.set(
    "n",
    "<leader>pv",
    vim.cmd.Oil,
    { desc = "[oil] file navigation" }
)

require("oil").setup({
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
    keymaps = {
        ["<leader>pv"] = "actions.close",
        ["<Esc>"] = "actions.close"
        -- <C-c> works by default
    }
})
