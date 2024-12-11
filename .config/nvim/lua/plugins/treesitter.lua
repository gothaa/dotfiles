return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      indent = {enable = true},
      hightlight = {enable = true},
      auto_install = true,
      additional_vim_regex_highlighting = false
    })
  end
}
