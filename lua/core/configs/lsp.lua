local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"eslint",
	"tsserver",
	"lua_ls",
	"rust_analyzer",
})

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
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I"
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
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
