-- Setup lazy package manager as first time
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load the module
for _,file in pairs(vim.fn.readdir(vim.fn.stdpath("config").."/lua/settings", [[v:val =~ "\.lua$"]])) do
  local status, set = pcall(require, "settings."..file:gsub("%.lua$", ""))
  if not status then
    print("Something wrong in your plugin: settings/"..file)
  end
end

require("lazy").setup({ -- Lazy package manager settings START
  defaults = {
    lazy = false,
    version = nil,
    cond = nil
  },
  install = {colorscheme = {"rose-pine"}, missing = true},
  spec = "plugins",
  ui = {
    size = {width = 0.85, height = 0.8},
    wrap = false,
    border = "single",
    title = "Lazy package manager", ---@type string only works when border is not "none"
    title_pos = "right", ---@type "center" | "left" | "right"
    backdrop = 60,
    pills = true ---@type boolean
  },
  performance = {
    cache = {enabled = true},
    reset_packpath = true,
    rtp = {
      reset = true,
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      }
    }
  },
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    version = true,
    sources = {
      "lazy",
      "rockspec",
      "packspec"
    }
  },
  rocks = {
    root = vim.fn.stdpath("data") .. "/lazy-rocks",
    server = "https://nvim-neorocks.github.io/rocks-binaries/"
  },
  change_dectection = {enabled = true, notify = false},
  checker = {enabled = false},
  throttle = 20
}) -- Lazy package manager settings END
