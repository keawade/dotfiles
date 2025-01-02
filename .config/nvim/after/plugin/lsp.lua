local lsp = require("lsp-zero").preset({})
local nvim_lsp = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)

lsp.preset("recommended")

lsp.ensure_installed(
    {
        "ts_ls",
        "eslint",
        "jsonls",
        "denols"
    }
)

local cmp = require("cmp")

lsp.on_attach(
    function(client, bufnr)
        vim.keymap.set(
            "n",
            "gd",
            function()
                vim.lsp.buf.definition()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] go to definition"
            }
        )
        vim.keymap.set(
            "n",
            "<F12>",
            function()
                vim.lsp.buf.definition()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] go to definition"
            }
        )
        vim.keymap.set(
            "n",
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] inspect"
            }
        )
        vim.keymap.set(
            "n",
            "<leader>vws",
            function()
                vim.lsp.buf.workspace_symbol()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] list symbols in workspace matching query"
            }
        )
        vim.keymap.set(
            "n",
            "<leader>vd",
            function()
                vim.diagnostic.open_float()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] open diagnostic"
            }
        )
        vim.keymap.set(
            "n",
            "[d",
            function()
                vim.diagnostic.goto_next()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] go to next diagnostic"
            }
        )
        vim.keymap.set(
            "n",
            "[d",
            function()
                vim.diagnostic.goto_prev()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] go to previous diagnostic"
            }
        )
        vim.keymap.set(
            "n",
            "<leader>vca",
            function()
                vim.lsp.buf.code_action()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] code action"
            }
        )
        -- TODO: Look into this again. Not sure how to close references panel currently
        --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set(
            "n",
            "<leader>vrn",
            function()
                vim.lsp.buf.rename()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] rename symbol"
            }
        )
        vim.keymap.set(
            "n",
            "<F2>",
            function()
                vim.lsp.buf.rename()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] rename"
            }
        )
        vim.keymap.set(
            "n",
            "<C-h>",
            function()
                vim.lsp.buf.signature_help()
            end,
            {
                buffer = bufnr,
                remap = false,
                desc = "[lsp] signature help"
            }
        )
    end
)

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

lsp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Select }),
        ["<C-Space>"] = cmp.mapping.complete({ behavior = cmp.SelectBehavior.Select })
    })
})
