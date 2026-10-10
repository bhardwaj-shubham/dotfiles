-- Leader handled in init.lua

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.cmdheight = 0

-- Clipboard
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Tabs & Indent (default = 2, override per filetype later)
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

-- Wrapping
opt.wrap = false
opt.linebreak = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Behavior
opt.showmode = false
opt.whichwrap = "bs<>[]hl"
opt.numberwidth = 4
opt.showtabline = 2
opt.backspace = "indent,eol,start"
opt.pumheight = 10
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.updatetime = 250
opt.timeoutlen = 200
opt.confirm = true

-- Completion
opt.completeopt = "menuone,noselect"
opt.shortmess:append("c")

-- Keywords
opt.iskeyword:append("-")

-- Format
opt.formatoptions:remove({ "c", "r", "o" })
