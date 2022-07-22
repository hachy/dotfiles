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
		json = {
			require("formatter.filetypes.json").prettier,
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
