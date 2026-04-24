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

-- unbind <c-l> in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-l>", { noremap = true, silent = true })
  end,
})
