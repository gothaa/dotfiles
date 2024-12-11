 return {
   "nvim-neo-tree/neo-tree.nvim",
   dependencies = {
     "nvim-lua/plenary.nvim",
     "MunifTanjim/nui.nvim",
     "3rd/image.nvim",
     {
       "s1n7ax/nvim-window-picker",
       name = "window-picker",
       event = "VeryLazy",
       opt = {
         filter_rules = {
           include_current_win = false,
           autoselect_one = true,
           bo = {
             filetype = {"neo-tree", "neo-tree-popup", "notify"},
             buftype = {"terminal", "quickfix"}
           }
         }
       }
     }
   },
   lazy = false,
   keys = {
     {"<F2>", "<cmd>Neotree<cr>", desc = "Open file explorer", mode = "n"},
     {"<F14>", "<cmd>Neotree close<cr>", desc = "Close file explorer", mode = "n"}
   },
 }
