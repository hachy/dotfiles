local util = require("formatter.util")

require("formatter").setup({
	logging = false,
	filetype = {
		ruby = {
			require("formatter.filetypes.ruby").rubocop,
		},
		gdscript = {
			function()
				return {
					exe = "gdformat",
					stdin = false,
				}
			end,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		css = {
			function()
				return {
					exe = "stylelint",
					args = {
						"--fix",
						"--stdin",
						"--stdin-filename",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
