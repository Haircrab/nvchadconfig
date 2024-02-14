local spec = {
  {
    "Djancyp/better-comments.nvim",
    lazy = false,
    config = function()
      require("better-comment").Setup {
        tags = {
          {
            name = "TODO",
            fg = "#FFA500",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "FIX",
            fg = "white",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "!",
            fg = "#f44747",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "*",
            fg = "#5F8575",
            bg = "",
            bold = false,
            virtual_text = "",
          },
          {
            name = "?",
            fg = "#2471A3",
            bg = "",
            bold = false,
            virtual_text = "",
          },
        },
      }
    end,
  },
}

return spec
