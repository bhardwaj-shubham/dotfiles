-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- core configs
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostics")
require("config.lazy")
