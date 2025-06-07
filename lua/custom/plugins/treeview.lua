return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
        { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in Neo-tree" },
    },
    opts = {
        toggle = false,
        reveal_force_cwd = true,
        reveal = true,
        filesystem = {
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true,
        },
        window = {
            width = 30,
            mappings = {
                ["<space>"] = "none",
                ["o"] = "open",
                ["<cr>"] = "open",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                ["t"] = "open_tabnew",
                ["C"] = "close_node",
                ["z"] = "close_all_nodes",
                ["Z"] = "expand_all_nodes",
                ["a"] = "add",
                ["A"] = "add_directory",
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy",
                ["m"] = "move",
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
            },
        },
    },

    config = function(_, opts)
        require("neo-tree").setup(opts)

        vim.api.nvim_create_augroup("NeoTreeProjectAutoOpen", { clear = true })

        vim.api.nvim_create_autocmd({ "DirChanged" }, {
            group = "NeoTreeProjectAutoOpen",
            callback = function()
                if vim.fn.isdirectory(vim.fn.getcwd() .. "/.git") then
                    vim.cmd("Neotree reveal reveal_force_cwd")
                    vim.defer_fn(function()
                        if vim.fn.filereadable("package.json") then
                            local current_window_width = vim.api.nvim_win_get_width(0)
                            local desired_width = math.floor(current_window_width * 0.80)
                            vim.cmd(desired_width .. "vsplit package.json")
                        end
                    end, 50)
                end
            end,
        })
    end,
}
