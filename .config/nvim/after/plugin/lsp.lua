local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

lsp.ensure_installed(
    {
        "tsserver",
        "eslint",
        "jsonls"
    }
)

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings =
    lsp.defaults.cmp_mappings(
    {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(cmp_select)
    }
)

lsp.on_attach(
    function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set(
            "n",
            "gd",
            function()
                vim.lsp.buf.definition()
            end,
            opts
        )
        vim.keymap.set(
            "n",
            "<F12>",
            function()
                vim.lsp.buf.definition()
            end,
            opts
        )
        vim.keymap.set(
            "n",
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            opts
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
            opts
        )
        vim.keymap.set(
            "n",
            "<C-h>",
            function()
                vim.lsp.buf.signature_help()
            end,
            opts
        )
    end
)

lsp.setup()
