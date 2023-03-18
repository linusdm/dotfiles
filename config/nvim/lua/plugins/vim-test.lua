return {
  "vim-test/vim-test",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "<leader>tn", vim.cmd.TestNearest, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile, { desc = "Run test file" })
    vim.keymap.set("n", "<leader>ts", vim.cmd.TestSuite, { desc = "Run test suite" })
    vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast, { desc = "Run last test" })

    vim.g["test#strategy"] = "neovim"
  end,
}
