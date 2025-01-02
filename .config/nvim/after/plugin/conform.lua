require("conform").setup({
    formatters_by_ft = {
        lua = { "stylelua" },
        javascript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        typescript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        handlebars = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        go = { "gofmt"  },
        rust = { "rustfmt"  },
        swift = { "swift_format"  },
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
