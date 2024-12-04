-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Show notification history
vim.api.nvim_set_keymap("n", "<leader>s_", ":lua Snacks.notifier.show_history()<CR>", {})

-- Colemak-DHm keymaps
vim.keymap.set({ "n", "v", "o" }, "n", "h", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "e", "k", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "i", "j", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "o", "l", { noremap = true })

vim.keymap.set({ "n", "v", "o" }, "h", "n", { noremap = true }) -- mnemonic: *h*op
vim.keymap.set({ "n", "v", "o" }, "j", "o", { noremap = true }) -- mnemonic: *j*ump
vim.keymap.set({ "n", "v", "o" }, "k", "i", { noremap = true }) -- mnemonic: *k*nob
vim.keymap.set({ "n", "v", "o" }, "l", "e", { noremap = true }) -- mnemonic: *l*ast

-- Capitalized Colemak-DHm keymaps
vim.keymap.set({ "n", "v", "o" }, "N", "H", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "E", "K", { noremap = true }) -- mnemonic: *E*xplain
vim.keymap.set({ "n", "v", "o" }, "I", "J", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "O", "L", { noremap = true })

vim.keymap.set({ "n", "v", "o" }, "H", "N", { noremap = true }) -- mnemonic: *h*op
vim.keymap.set({ "n", "v", "o" }, "J", "O", { noremap = true }) -- mnemonic: *j*ump
vim.keymap.set({ "n", "v", "o" }, "K", "I", { noremap = true }) -- mnemonic: *k*nob
vim.keymap.set({ "n", "v", "o" }, "L", "E", { noremap = true }) -- mnemonic: *l*ast
