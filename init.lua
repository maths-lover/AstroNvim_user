return {
  updater = { skip_prompts = true },
  colorscheme = "dawnfox",
  lsp = require "user.lsp",
  polish = function()
    vim.filetype.add {
      pattern = {
        ["/tmp/neomutt.*"] = "markdown",
      },
    }
    require "user.autocmds"
  end,
}
