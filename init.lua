-- Set leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.lazy")

-- Sets colorscheme
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- Absolute numbering in insert mode, relative numbering in normal mode
vim.opt.number = true
local relative_numbering = vim.api.nvim_create_augroup("relative_numbering", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = relative_numbering,
  pattern = "*",
  callback = function() 
    vim.opt.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = relative_numbering,
  pattern = "*",
  callback = function() 
    vim.opt.relativenumber = false
  end,
})

-- Splitting creates new screen on right side
vim.opt.splitright = true

-- Allows filetype detection and loads plugins and indentation rules for that specific filetype
vim.cmd("filetype plugin indent on")

-- Search options - highlights search results as I type, not case-sensitive
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- Command line completion? I still don't really know what this is
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest", "list:full" }

-- Shows matching parantheses, braces, etc
vim.opt.showmatch = true

-- Allows undo even after closing and re-opening a file
vim.opt.undofile = true

-- AUTO INDENT
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable true colors
vim.opt.termguicolors = true

-- I hate code
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


--
-- AUTOCOMMANDS
--


-- Custom filetype rules. Neovim SHOULD have automatic language based
-- indentation rules, but it's decided to be absolutely stupid and not work.
-- Stupid garbage truckload of grab that doesn't friggin work I hate computers.
-- If you ever actually find a solution, these might be deletable.
local filetype_rules = vim.api.nvim_create_augroup("filetype_indentation", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_rules,
  pattern = { "lua", "html", "javascript", "typescript" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_rules,
  pattern = { "json", "sh" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_rules,
  pattern = "zig",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "100"
  end,
})

-- Rules used for Linux Kernel Coding Style
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_rules,
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.indentexpr = ""
    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = ":0,l1,t0,g0,(0,u0,U0"
    vim.opt_local.colorcolumn = "80,100"
  end,
})




-- Linter. Literally just for checkpatch.pl for linux kerenel dev =)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end
})
