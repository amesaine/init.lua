return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() require("nvim-treesitter.install").update({ with_sync = true })() end,
        config = function()
            require('nvim-treesitter.configs').setup({
                ignore_install = {},
                modules = {},
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "html",
                    "toml",
                    "go",
                    "python",
                    "zig",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require 'treesitter-context'.setup {
                max_lines = 1,           -- How many lines the window should span. Values <= 0 mean no limit.
                multiline_threshold = 1, -- Maximum number of lines to show for a single context
            }
            vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "NormalFloat" })
        end
    }
}
