local lsp = require("lsp-zero").preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"eslint",
	"tsserver",
	"lua_ls",
	"rust_analyzer",
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- Fix Undefined global "vim"
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I"
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>tt", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>gg", function() vim.lsp.buf.format() end, opts)

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Format on save
--vim.cmd([[
--	autocmd BufWritePre *.tsx lua vim.lsp.buf.format({async = false})
--]])

local group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	pattern = {
		"*.js",
		"*.ts",
		"*.html",
		"*.css", -- TODO: add css supersets
		"*.json",
		-- react
		"*.jsx",
		"*.tsx",
		-- prisma
		"*.prisma",
		-- rust
		"*.rs",
		"*.toml"
	},
	callback = function ()
		vim.lsp.buf.format({async = false})
	end

})



-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set("n", "<space>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)
-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
-- vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)

-- append text after the warning or error

lsp.setup()

vim.diagnostic.config({
virtual_text = true
})
