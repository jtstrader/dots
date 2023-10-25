-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		python = {
			-- black config
			function()
				return {
					exe = "black",
					args = {
						"--line-length 100",
						"-q",
						"-",
					},
					stdin = true,
				}
			end,

			require("formatter.filetypes.python").isort,

			-- autopep8 config
			function()
				return {
					exe = "autopep8",
					args = {
						"--max-line-length 100",
						"-",
					},
					stdin = true,
				}
			end,
		},

		go = {
			require("formatter.filetypes.go").gofumpt,
		},

		cpp = {
			-- Set default tab size to 4 spaces and line lengths to 100
			function()
				return {
					exe = "clang-format",
					args = {
						"-style='{IndentWidth: 4, ColumnLimit: 100}'",
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},

		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},

		c = {
			require("formatter.filetypes.c").clangformat,
		},

		ocaml = {
			function()
				return {
					exe = "ocamlformat",
					args = {
						util.get_current_buffer_file_path(),
					},
					stdin = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
