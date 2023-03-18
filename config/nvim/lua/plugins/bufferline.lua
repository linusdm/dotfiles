return {
  "akinsho/bufferline.nvim",
  version = "v3.x",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function(_, opts)
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            -- highlight = "Directory",
            -- separator = true,
          },
        },
      },
    }
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<cr>")
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<cr>")
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
