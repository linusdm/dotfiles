return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("tokyonight").setup {
        -- make the line number brighter
        on_highlights = function(highlights, colors)
          highlights.LineNr = {
            fg = highlights.CursorLineNr.fg,
          }
          highlights.CursorLineNr = {
            fg = colors.orange,
            bold = true,
          }
        end,
      }
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  -- "folke/which-key.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      -- A list of parser names, or "all" (the five initial parsers should always be installed)
      ensure_installed = { "c", "lua", "vim", "help", "query", "elixir", "eex", "heex" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          code_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      refactor = {
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
      },
      context = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
    },
  },
  {
    "mhanberg/elixir.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    config = function()
      local elixir = require("elixir")

      elixir.setup {
        settings = elixir.settings {
          dialyzerEnabled = true,
          enableTestLenses = false,
        },
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        on_attach = function(client, bufnr)
          require("linusdm.lsp").on_attach(client, bufnr)

          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  { "tpope/vim-surround", event = { "BufReadPost", "BufNewFile" } },
}
