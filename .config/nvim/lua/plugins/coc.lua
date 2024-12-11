return {
  "neoclide/coc.nvim",
  dependencies = {
    {"tjdevries/coc-zsh", lazy = true, ft = "zsh"}
  },
  branch = "master",
  build = "npm ci"
}
