return {
	updater = {
		skip_prompts = true,
		channel = "nightly",
		branch = "v2",
	},
	colorscheme = "nightfox",
	lsp = require("user.lsp"),
	polish = function()
		vim.filetype.add({
			pattern = {
				["/tmp/neomutt.*"] = "markdown",
			},
		})
		require("user.autocmds")
	end,
}
