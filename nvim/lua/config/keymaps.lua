-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Disable space default
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Better movement (wrapped lines)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right Window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })

-- Window Management
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close Window" })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close Others" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>bb", "<cmd>bnext<cr>", {
  desc = "Next Buffer",
})

map("n", "<leader>bB", "<cmd>bprevious<cr>", {
  desc = "Prev Buffer",
})

map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", {
  desc = "Pick Buffer",
})

map("n", "<leader>bi", "<Cmd>BufferLineTogglePin<CR>", {
  desc = "Pin Buffer",
})

map("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, {
  desc = "Delete Buffer",
})

map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", {
  desc = "Delete Others",
})

-- Save
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<esc><cmd>w<cr>", { desc = "Save File" })

-- Format on Save
map("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Code" })

-- Clear search
map("n", "<leader>ur", "<cmd>nohlsearch<CR>", { desc = "Clear Search" })

-- Search
map("n", "<leader>st", "<cmd>TodoTelescope<CR>", {
  desc = "Todo Comments",
})

map("n", "<leader>sr", function()
  require("grug-far").open()
end, {
  desc = "Search & Replace",
})

map("n", "<leader>sw", function()
  require("grug-far").open({
    prefills = {
      search = vim.fn.expand("<cword>"),
    },
  })
end, {
  desc = "Replace Word",
})
-- Better search navigation
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true })

-- Undo breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>lw", vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbols" })
map("n", "<leader>lf", function()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end, {
  desc = "Format",
})

-- Glance
map("n", "<leader>ld", "<cmd>Glance definitions<cr>", {
  desc = "Peek Definition",
})
map("n", "<leader>li", "<cmd>Glance implementations<cr>", {
  desc = "Peek Implementations",
})
map("n", "<leader>lR", "<cmd>Glance references<cr>", {
  desc = "Peek References",
})
map("n", "<leader>lt", "<cmd>Glance type_definitions<cr>", {
  desc = "Peek Type Definition",
})

-- Diagnostics
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- Quickfix
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next Quickfix" })

-- Location list
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })

-- Lazy
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy Plugins" })

-- Mason
map("n", "<leader>pm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Theme switcher
map("n", "<leader>ut", function()
  require("config.theme").pick()
end, { desc = "Theme Switcher" })

-- Notification History
map("n", "<leader>nn", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })

map("n", "<leader>nd", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss Notifications" })

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })

-- Markview
map("n", "<leader>mv", "<cmd>Markview toggle<CR>", {
  desc = "Toggle Markdown preview",
})
map("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", {
  desc = "Toggle Markdown split preview",
})

-- LazyGit
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "LazyGit" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
