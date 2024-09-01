local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"morhetz/gruvbox", name = "gruvbox"},
    {"catppuccin/nvim", name = "catppuccin"},
    "kyazdani42/nvim-web-devicons",
    {"nvim-lualine/lualine.nvim", config = require("lualine_setup")},
    "b0o/mapx.nvim",
    {"simrat39/rust-tools.nvim"},
    "williamboman/nvim-lsp-installer",
    {"neovim/nvim-lspconfig", config = function()
         require('lsp_setup')
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = require("nullls_setup"),
    },
    {
        "MunifTanjim/eslint.nvim",
        config = require("eslint_setup")
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" }
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "nvim-treesitter/nvim-treesitter",
        config = require("treesitter_setup"),
    },
    "windwp/nvim-ts-autotag",
    {
        "kyazdani42/nvim-tree.lua",
        config = require("tree_setup")
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-telescope/telescope-project.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("telescope_setup")
        end,
    },
    {"numToStr/Comment.nvim", config = require("comment_setup")},
    {"tpope/vim-surround"},
    "tpope/vim-sleuth",
    "kdheepak/lazygit.nvim",
    "907th/vim-auto-save",
    {"windwp/nvim-autopairs", config = require("autopairs_setup")},
    {"prettier/vim-prettier", build = "yarn install --frozen-lockfile --production"},
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
            {
                "<leader>lt",
                function()
                    require("laravel.tinker").send_to_tinker()
                end,
                mode = "v",
                desc = "Laravel Application Routes",
            },
        },
        event = { "VeryLazy" },
        config = function()
            require("laravel").setup()
            require("telescope").load_extension "laravel"
        end,
    }
})
require("cmp_setup")
require("luasnip.loaders.from_vscode").lazy_load()
