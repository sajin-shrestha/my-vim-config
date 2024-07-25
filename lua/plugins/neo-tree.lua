-- return {
--	"nvim-neo-tree/neo-tree.nvim",
--	branch = "v3.x",
--	dependencies = {
--		"nvim-lua/plenary.nvim",
--		"nvim-tree/nvim-web-devicons",
--		"MunifTanjim/nui.nvim",
--	},
--	config = function()
--		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})
--		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
--	end,
-- }

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,  -- Show hidden files
                },
            },
        })
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}

