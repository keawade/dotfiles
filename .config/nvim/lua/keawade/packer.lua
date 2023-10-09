-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Really nice fuzzy finder
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.3",
            requires = { {"nvim-lua/plenary.nvim"} }
        }

        -- Theme
        use { "catppuccin/nvim", as = "catppuccin" }

        -- Incremental parsing system for editor tools
        use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
        use("nvim-treesitter/playground")

        -- Indent guides for Neovim
        use "lukas-reineke/indent-blankline.nvim"

        -- Creates a list of quick swap targets
        use {
            "theprimeagen/harpoon",
            requires = { {"nvim-lua/plenary.nvim"} }
        }

        -- Undo history visualizer
        use("mbbill/undotree")

        -- Git plugin. Provides access to arbitrary git commands out of the vim
        -- command tray and for remapping
        use("tpope/vim-fugitive")

        -- Language server configuration
        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"}, -- Required
                {
                    -- Optional
                    "williamboman/mason.nvim",
                    run = function()
                        pcall(vim.cmd, "MasonUpdate")
                    end
                },
                {"williamboman/mason-lspconfig.nvim"}, -- Optional
                -- Autocompletion
                {"hrsh7th/nvim-cmp"}, -- Required
                {"hrsh7th/cmp-nvim-lsp"}, -- Required
                {"L3MON4D3/LuaSnip"} -- Required
            }
        }

        -- Neovim file explorer: edit your filesystem like a buffer
        use {
            "stevearc/oil.nvim",
            config = function() require('oil').setup() end
        }
        -- Pretty icons on files
        use 'nvim-tree/nvim-web-devicons'

        -- Integrates nvim and tmux controls
        use "christoomey/vim-tmux-navigator"

        -- Shows an overlay with options after keypresses to help remind me what
        -- mappings are available
        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {}
            end
        }

        use "sbdchd/neoformat"

        use "lewis6991/gitsigns.nvim"

        use "tpope/vim-surround"
        use "tpope/vim-commentary"
    end
)
