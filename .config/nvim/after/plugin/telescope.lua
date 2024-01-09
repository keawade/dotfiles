local builtin = require("telescope.builtin")

-- Copied from https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree = {}

project_files = function()
    local opts = {} -- define here if you want to define something

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if is_inside_work_tree[cwd] then
        builtin.git_files(opts)
    else
        builtin.find_files(opts)
    end
end
-- End copy from https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory

vim.keymap.set("n", "<leader>pf", project_files, {desc = "[telescope] find files"})
vim.keymap.set("n", "<leader>pg", builtin.git_status, {desc = "[telescope] git status"})
vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep({ layout_strategy = 'vertical' })
end, {desc = "[telescope] live grep"})
vim.keymap.set("n", "<leader>py", function()
    builtin.lsp_document_symbols({ layout_strategy = 'vertical' })
end, {desc = "[telescope] symbols"})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {desc = "[telescope] buffers"})
vim.keymap.set("n", "<leader>pc", builtin.commands, {desc = "[telescope] commands"})
vim.keymap.set("n", "<leader>pm", builtin.man_pages, {desc = "[telescope] man pages"})

vim.keymap.set("n", "<A-f>", builtin.grep_string, {desc = "[telescope] grep string"})
