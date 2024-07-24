-- return {
--   {
--     "williamboman/mason.nvim",
--     lazy = false,
--     config = function()
--       require("mason").setup()
--     end,
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     lazy = false,
--     opts = {
--       auto_install = true,
--     },
--   },
--   {
--     "neovim/nvim-lspconfig",
--     lazy = false,
--     config = function()
--       local capabilities = require('cmp_nvim_lsp').default_capabilities()

--       local lspconfig = require("lspconfig")
--       lspconfig.tsserver.setup({
--         capabilities = capabilities
--       })
--       lspconfig.solargraph.setup({
--         capabilities = capabilities
--       })
--       lspconfig.html.setup({
--         capabilities = capabilities
--       })
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities
--       })

--       vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--       vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--       vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--     end,
--   },
-- }

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      local servers = { "tsserver", "solargraph", "html", "lua_ls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<Esc>", "<C-o>", opts)
          end,
        })
      end
    end,
  },
}

