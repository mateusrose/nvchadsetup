return {
  "3rd/image.nvim",
  event = "VeryLazy",
  build = false,
  opts = {
    backend = "kitty",
    integrations = {
      markdown = { enabled = true },
    },
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.bmp", "*.ico", "*.svg" },
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
  },
}
