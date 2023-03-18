return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.trim_newlines,
        -- null_ls.builtins.formatting.pg_format,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.remark,
      },
      on_attach = require("linusdm.lsp").on_attach,
    }
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
