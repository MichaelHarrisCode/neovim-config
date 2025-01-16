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
