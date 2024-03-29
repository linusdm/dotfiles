return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    current_line_blame = true,
    -- current_line_blame_formatter = "   <author>, <committer_time:%R> • <summary>",
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "<leader>gj", function()
        if vim.wo.diff then
          return "<leader>gj"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "<leader>gk", function()
        if vim.wo.diff then
          return "<leader>gk"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Actions
      map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
      -- map('n', '<leader>hS', gs.stage_buffer)
      map("n", "<leader>gu", gs.undo_stage_hunk)
      -- map('n', '<leader>hR', gs.reset_buffer)
      map("n", "<leader>gp", gs.preview_hunk)
      -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      -- map('n', '<leader>tb', gs.toggle_current_line_blame)
      -- map('n', '<leader>hd', gs.diffthis)
      -- map('n', '<leader>hD', function() gs.diffthis('~') end)
      -- map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
