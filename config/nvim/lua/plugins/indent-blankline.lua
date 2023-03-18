return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.opt.list = true
    vim.opt.listchars:append("eol:↴")
  end,
  opts = {
    show_end_of_line = true,
  },
}
