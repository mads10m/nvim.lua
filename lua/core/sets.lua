-- TODO set spell files.set
-- I have copyied it over to nvim config (spell)

-- Fat cursor
vim.opt.guicursor = ""

-- For git-gutter
vim.opt.updatetime=1000

vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.signcolumn = "yes"

-- split below or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Better auto complete in command mode
vim.opt.wildmode = "longest,list,full"

-- Auto spell check in git commits
--autocmd FileType gitcommit setlocal spell
vim.api.nvim_create_autocmd({"BufRead"}, {
	desc = "Auto spell check on git commits",
	pattern = "COMMIT_EDITMSG",
	command = "setlocal spell spelllang=en"
})
