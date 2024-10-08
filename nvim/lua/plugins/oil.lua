return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require "oil"
        oil.setup({
            -- default_file_explorer = true,
            columns = { "icon" },
            buf_options = { buflisted = false, bufhidden = "hide", },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
            },
            delete_to_trash = false,
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = true,
            constrain_cursor = "name",
            keymaps = {
                ["?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-C>"] = oil.discard_all_changes(),
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["<C-Home>"] = "gg",
                ["<C-End>"] = "G",
                ["="] = function()
                    if vim.g.oil_size_column == 1 then
                        oil.set_columns({ "icon" })
                        vim.g.oil_size_column = 0
                    else
                        oil.set_columns({ "icon", "size" })
                        vim.g.oil_size_column = 1
                    end
                end,
                ["Y"] = "actions.yank_entry",
            },
            natural_order = false,
            use_default_keymaps = false,
            view_options = { show_hidden = true, },
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                minimized_border = "none",
                win_options = { winblend = 10, },
            },
        })
        vim.keymap.set({ "n" }, "-", oil.open)
    end
}
