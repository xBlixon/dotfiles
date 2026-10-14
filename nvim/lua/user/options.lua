-- Line relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- System clipboard copy/paste
map({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map({"n", "v"}, "<leader>p", [["+p]], { desc = "Paste to system clipboard" })

-- Save close
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Close file" })

-- Clear search highlighting
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Switching between nvim windows
map("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

-- Moving lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Przesuń blok w dół" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Przesuń blok w górę" })

-- Center view while scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

