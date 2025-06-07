-- lua/plugins/nvimtree.lua
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
                ["O"] = "open_no_focus",
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
}
