return {

  -- {
  --   "HendrikPetertje/telescope-media-files.nvim",
  --   branch = "fix-replace-ueber-with-viu",
  --   dependencies = {
  --     "nvim-lua/popup.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  {
    "telescope.nvim",
    keys = {
      -- {
      --   "<leader>/",
      --   "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      --   desc = "Grep (root dir)",
      -- },
      {
        "<leader>s-",
        "<cmd>:Telescope grep_string<CR>",
        desc = "Search word under cursor",
      },
      {
        "<leader>fl",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        local t = require("telescope")

        t.load_extension("flutter")
        -- t.load_extension("media_files")
        t.load_extension("package_info")
        t.setup({
          pickers = { find_files = { hidden = true } },
          extensions = {
            package_info = {
              -- Optional theme (the extension doesn't set a default theme)
              theme = "ivy",
            },
          },
        })
        -- require("telescope").load_extension("live_grep_args")
      end)
    end,
  },
}
