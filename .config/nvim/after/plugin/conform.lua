require("conform").setup({
    formatters_by_ft = {
        lua = { "stylelua" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        handlebars = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        go = { { "gofmt" } },
        rust = { { "rustfmt" } },
        swift = { { "swift_format" } },
    },
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end

        return { timeout_ms = 500, lsp_fallback = true }
    end
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

-- Keymap to format
vim.keymap.set("", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, {desc = "[conform] format file"})

-- Keymap to toggle autoformat setting
vim.keymap.set("n", "<leader><leader>", function()
    if vim.b.disable_autoformat or vim.g.disable_autoformat then
        vim.cmd("FormatEnable")
    else
        vim.cmd("FormatDisable")
    end
end, {desc = "[conform] toggle autoformat"})
