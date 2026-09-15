return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
        "clangd",
        "pyright",
        "zls",
        "perlnavigator",
      },
      automatic_installation = true
    }

    vim.lsp.config('lua_ls', {
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

    vim.lsp.config('clangd', {
      cmd = {
        "clangd",
        "--background-index",
        "--header-insertion=never"
      }
    })
  end
}
