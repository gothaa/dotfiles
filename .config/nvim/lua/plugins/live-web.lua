return {
  "brianhuster/live-preview.nvim",
  ft = "html",
  dependencies = {
    "brianhuster/autosave.nvim"
  },
  opts = {
    cmd = "LivePreview",
    port = 5500,
    autokill = false,
    browser = "default",
    dynamic_root = false,
    picker = "telescope"
  }
}
