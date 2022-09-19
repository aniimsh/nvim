-- Treesitter configuration

require('nvim-treesitter.configs').setup({
	highlight = { enable = true, additional_vim_regex_highlighting = false},
  -- We must manually specify which parsers to install
	ensure_installed = {
    "bash",
    "html",
    "css",
    "c",
    "cpp",
    "cuda",
		"json",
		"lua",
    "python",
    "yaml",
	},
})
