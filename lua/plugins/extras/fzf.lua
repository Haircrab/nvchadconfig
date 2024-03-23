return {
  "ibhagwan/fzf-lua",
  cmd = {"FzfLua", "FzfLua files", "FzfLua live_grep", "FzfLua buffers"},
  -- optional for icon support
  dependencies = { 'vijaymarupudi/nvim-fzf', "nvim-tree/nvim-web-devicons",
    {
      "junegunn/fzf",
      build = "./install --bin"
    },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end
}
