-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- show relative line numbers
vim.opt.relativenumber = true

-- set tab to 4 spaces (tabstop + shiftwidth)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- keep indentation consistent when hitting <Tab>
vim.opt.expandtab = true -- uncomment if you want tabs to insert spaces

-- map visual block to another combination to free for clipboard
vim.keymap.set("n", "<C-q>", "<C-v>", { noremap = true, silent = true })

-- copy and paste to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- NOTE: `map` affects normal/visual/operator modes; in Lua we can mimic that
vim.keymap.set({ "n", "v", "o" }, "<C-v>", '"+P', { noremap = true, silent = true })

-- use alt to switch between windows

local opts = { noremap = true, silent = true }

-- Normal mode: just move window focus
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", opts)

-- Insert mode: run one normal command (<C-w>h/j/k/l) then return to insert
vim.keymap.set("i", "<A-h>", "<C-o><C-w>h", opts)
vim.keymap.set("i", "<A-j>", "<C-o><C-w>j", opts)
vim.keymap.set("i", "<A-k>", "<C-o><C-w>k", opts)
vim.keymap.set("i", "<A-l>", "<C-o><C-w>l", opts)

-- Visual mode: exit visual, then move focus
vim.keymap.set("v", "<A-h>", "<Esc><C-w>h", opts)
vim.keymap.set("v", "<A-j>", "<Esc><C-w>j", opts)
vim.keymap.set("v", "<A-k>", "<Esc><C-w>k", opts)
vim.keymap.set("v", "<A-l>", "<Esc><C-w>l", opts)

-- Terminal mode: leave terminal-mode, then move focus (documented pattern)
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", opts)
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", opts)
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", opts)

-- unbind <c-l> in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-l>", { noremap = true, silent = true })
  end,
})
