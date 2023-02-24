-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-- Quick buffer navigation
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Quick save
map("n", "<Leader>s", ":update<CR>", { silent = true }) 
map("i", "<Leader>s", "<Esc>:update<CR>i", { silent = true })
map("v", "<Leader>s", "<Esc>:w<CR>", { silent = true })

-- Spell check
map("n", "<F6><F6>", ":setlocal spell!<CR>")
map("n", "<F6>e", ":setlocal spell spelllang=en_us<CR>")
map("n", "<F6>d", ":setlocal spell spelllang=da<CR>")
