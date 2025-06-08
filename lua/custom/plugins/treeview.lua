_G.last_neotree_package_json_execution_time = 0

function _G.openNeotreeAndPackageJsonConditionalSplit()
  if vim.fn.isdirectory(vim.fn.getcwd() .. "/.git") then
    local current_time = vim.fn.reltime()[1]

    -- Step 1: Check if more than 1 second has passed since the last execution (debounce)
    if current_time - _G.last_neotree_package_json_execution_time >= 1 then
      -- Step 2: If debounced, update the last execution time immediately.
      _G.last_neotree_package_json_execution_time = current_time

      -- Step 3: Schedule the actual commands to run after a 200ms delay
      vim.defer_fn(function()
        -- Always reveal Neotree
        vim.cmd("Neotree reveal reveal_force_cwd")

        -- Get the number of currently open windows
        local num_open_windows = #vim.api.nvim_list_wins()

        -- Only vsplit if there are exactly 2 windows open (the current one and one other)
        if num_open_windows == 1 then
          local current_window_width = vim.api.nvim_win_get_width(0)
          local desired_width = math.floor(current_window_width * 0.80)

          vim.cmd(desired_width .. "vsplit enew")
        end
      end, 200) -- 200 milliseconds delay
    end
  end
end


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
        { "<A-1>",     "<cmd>Neotree reveal<cr>", desc = "Reveal current file in Neo-tree" },
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
              vim.cmd("Neotree reveal reveal_force_cwd")
              _G.openNeotreeAndPackageJsonConditionalSplit();
            end,
        })
    end,
}
