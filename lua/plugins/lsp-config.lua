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
--       local servers = { "tsserver", "solargraph", "html", "lua_ls", "clangd", "gopls", "eslint"}

--       for _, server in ipairs(servers) do
--         local ok, err = pcall(function()
--           lspconfig[server].setup({
--             capabilities = capabilities,
--             on_attach = function(client, bufnr)
--               local opts = { noremap = true, silent = true, buffer = bufnr }
--               vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--               vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
--               vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
--               vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--               vim.keymap.set("n", "<Esc>", "<C-o>", opts)
--             end,
--           })
--         end)

--         if not ok then
--           vim.notify("Error setting up LSP for " .. server .. ": " .. err, vim.log.levels.ERROR)
--         end
--       end
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
      local servers = { "tsserver", "solargraph", "html", "lua_ls", "clangd", "gopls", "eslint" }

      local notify_error = function(msg)
        vim.notify(msg, vim.log.levels.ERROR, { title = "LSP Error", timeout = 5000 })
      end

      local custom_on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Esc>", "<C-o>", opts)
      end

      for _, server in ipairs(servers) do
        local ok, err = pcall(function()
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = custom_on_attach,
          })
        end)

        if not ok then
          notify_error("Error setting up LSP for " .. server .. ": " .. err)
        end
      end

      vim.diagnostic.config({
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
          format = function(diagnostic)
            return string.format("Error: %s", diagnostic.message)
          end,
        },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          source = "always",
          border = "rounded",
          focusable = false,
        },
      })

      -- Set the highlight group for diagnostic errors
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF0000", bold = true, italic = true })
    end,
  },
}

