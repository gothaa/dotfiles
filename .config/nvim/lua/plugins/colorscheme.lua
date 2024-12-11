return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "auto",
      dark_variant = "main",
      dim_inactive_window = true,
      extend_background_behind_borders = true,
      enable = {
        terminal = true,
        highlight = true,
        migrations = true
      },
      style = {
        bold = true,
        italic = true,
        transparency = true
      }
    })
    vim.cmd[[colorscheme rose-pine]]
    end
}
