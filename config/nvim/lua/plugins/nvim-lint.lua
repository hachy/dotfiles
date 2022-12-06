require("lint").linters_by_ft = {
	css = { "stylelint" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
