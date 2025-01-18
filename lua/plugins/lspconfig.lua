return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "clangd", "rust_analyzer" },
      automatic_installation = true
    }

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {}
    lspconfig.clangd.setup {}
    lspconfig.rust_analyzer.setup {}
  end
}
