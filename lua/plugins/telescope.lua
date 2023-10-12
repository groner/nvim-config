return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>,",
        function()
          require("telescope.builtin").buffers({ sort_mru = true, show_all_buffers = true })
        end,
        desc = "Buffers",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },

    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          -- flex
          flex = {
            flip_lines = 70,
            flip_columns = 200,
          },

          horizontal = {
            preview_width = 0.5,
            preview_cutoff = 50,
          },

          vertical = {
            preview_height = 0.5,
            preview_cutoff = 15,
          },
        },
      },
    },
  },
}
