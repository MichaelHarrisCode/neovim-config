return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "ts_ls", "clangd" },
      automatic_installation = true
    }

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
    -- Installed this for Linux kernel development... didn't work out well...
    -- didn't seem to recognize compile_commands.json and I got sick of dealing 
    -- with it. If idea ever comes to fix it, go ahead. Otherwise, I don't 
    -- think I need it... I hate computers
    --lspconfig.clangd.setup({
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
    --})

    lspconfig.clangd.setup {}
    lspconfig.rust_analyzer.setup {}
    lspconfig.ts_ls.setup {}
  end
}
