-- catppuccin-theme
-- return {
--     {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme "catppuccin-mocha"
--     end
--   }
-- }

-- nord-theme
-- return {
--   {
--     "arcticicestudio/nord-vim",
--     lazy = false,
--     name = "nord",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme "nord"
--     end
--   }
-- }

-- bluloco-theme
return {
  {
    "uloco/bluloco.nvim",
    lazy = false,
    name = "bluloco",
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd.colorscheme "bluloco"
    end
  }
}
