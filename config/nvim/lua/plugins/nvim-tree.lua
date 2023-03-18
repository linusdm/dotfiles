return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    -- form nvidisable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
  end,
  config = function()
    require("nvim-tree").setup {
      renderer = {
        group_empty = true,
      },
    }

    vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<cr>")
  end,
}
