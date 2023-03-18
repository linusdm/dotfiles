vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.tmp")

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.keymap.set("n", "<Leader>h", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<Leader>c", "<cmd>bdelete<cr>")

-- keep visual mode after indent
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
  "folke/which-key.nvim",
  {
    "akinsho/bufferline.nvim",
    version = "v3.x",
    config = function(_, opts)
      require("bufferline").setup {}
      vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<cr>")
      vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<cr>")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
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

      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      -- vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>st", live_grep_args.live_grep_args, {})
      vim.keymap.set("n", "<leader>go", builtin.git_status, {})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-live-grep-args.nvim",
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
}, {
  install = {
    colorscheme = { "tokyonight" },
  },
})
