return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  event = "VeryLazy",
  opts = function(_, _)
    local lga_actions = require("telescope-live-grep-args.actions")

    return {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("live_grep_args")

    local builtin = require("telescope.builtin")
    local live_grep_args = require("telescope").extensions.live_grep_args

    vim.keymap.set("n", "<leader>f", builtin.git_files, {})
    -- vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>st", live_grep_args.live_grep_args, {})
    vim.keymap.set("n", "<leader>go", builtin.git_status, {})
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
}
