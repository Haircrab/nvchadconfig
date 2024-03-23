return {
  "vinnymeller/swagger-preview.nvim",
  cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
  run = "npm install -g swagger-ui-watcher",
  config = function()
    require("swagger-preview").setup {
      -- The port to run the preview server on
      port = 9199,
      -- The host to run the preview server on
      host = "localhost",
    }
  end,
}
