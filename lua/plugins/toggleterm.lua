-- Add the plugin
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 20,  -- size of the terminal window
      open_mapping = [[<C-\>]],  -- key mapping to open the terminal
      hide_numbers = true,  -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '2',  -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true,  -- whether or not the open mapping applies in insert mode
      terminal_mappings = true,  -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = 'float',  -- other options: 'vertical' | 'tab' | 'float'
      close_on_exit = true,  -- close the terminal window when the process exits
      shell = vim.o.shell,  -- change the default shell
      float_opts = {
        border = 'curved',  -- 'single' | 'double' | 'shadow' | 'curved'
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    })

    -- Set key binding to toggle terminal
    local options = { noremap = true, silent = true }
    vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>", options)
    vim.keymap.set("i", "<C-\\>", "<Esc>:ToggleTerm<CR>", options)
    vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", options)
  end,
}

