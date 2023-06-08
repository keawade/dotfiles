-- Attempt to find executable in a `node_modules/.bin` directory
vim.g.neoformat_try_node_exe = 1
-- Override JS default formatter order
vim.g.neoformat_enabled_javascript = {
    "prettierd",
    "prettier",
    "jsbeautify",
    "standard",
    "semistandard",
    "prettydiff",
    "clangformat",
    "esformatter",
    "prettiereslint",
    "eslint_d",
    "denofmt"
}
-- Override TS default formatter order
vim.g.neoformat_enabled_javascript = {
    "prettierd",
    "prettier",
    "prettiereslint",
    "tsfmt",
    "tslint",
    "eslint_d",
    "clangformat",
    "denofmt"
}
-- Override JSON default formatter order
vim.g.neoformat_enabled_json = {
    "prettierd",
    "prettier",
    "jsbeautify",
    "prettydiff",
    "jq",
    "fixjson",
    "denofmt"
}

vim.keymap.set(
    "n",
    "<leader>f",
    function()
        vim.cmd("Neoformat")
    end,
    {desc = "[neofmt] format file"}
)

-- TODO: Maybe remove? Gotta feel this out a bit.
vim.cmd [[autocmd BufWritePre * undojoin | Neoformat]]
