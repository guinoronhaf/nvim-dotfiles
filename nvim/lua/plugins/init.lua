return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "java", "python"
            },
        },
    },

    -- Java LSP (jdtls)
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function()
            require("configs.jdtls")
        end,
    },

    -- Debugging (DAP)
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end,
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

}
