return {
  {
    "folke/noice.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    opts = {
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = false,
        view_search = false,
      },
    },
  },

  { "rcarriga/nvim-notify", opts = {
    render = "wrapped-compact",
    stages = "fade",
  } },
}
