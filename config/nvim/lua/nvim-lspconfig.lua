local nvim_lsp = require("lspconfig")

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
end

nvim_lsp.gdscript.setup({})

local servers = { "solargraph", "pylsp", "jsonls" }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		flags = {
			debounce_text_changes = 150,
		},
	})
end

local signs = { Error = "✘", Warn = "⚠", Hint = "✔", Info = "●" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local hl_tbl = {
	[vim.diagnostic.severity.ERROR] = "DiagnosticError",
	[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
	[vim.diagnostic.severity.HINT] = "DiagnosticHint",
	[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
}

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
	bufnr = bufnr or 0
	line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
	opts = opts or { ["lnum"] = line_nr }

	local line_diagnostics = vim.diagnostic.get(bufnr, opts)
	if vim.tbl_isempty(line_diagnostics) then
		return
	end

	local diagnostic_message = ""
	local hl = "Normal"
	for i, diagnostic in ipairs(line_diagnostics) do
		diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
		if i ~= #line_diagnostics then
			diagnostic_message = diagnostic_message .. "\n"
		end
		hl = hl_tbl[diagnostic.severity]
	end
	vim.api.nvim_echo({ { diagnostic_message, hl } }, false, {})
end

vim.cmd([[ autocmd! CursorHold * lua PrintDiagnostics() ]])
