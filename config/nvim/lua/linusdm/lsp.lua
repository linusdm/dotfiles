return {
  on_attach = function(client, bufnr)
    local map_opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "df", vim.lsp.buf.format, map_opts)
    -- vim.keymap.set("n", "gd", vim.diagnostic.open_float, map_opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, map_opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, map_opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, map_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, map_opts)
    vim.keymap.set("n", "<space>r", vim.lsp.codelens.run, map_opts)
  end,
}
