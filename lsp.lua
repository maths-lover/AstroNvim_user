return {
	servers = {
		"cmake",
		"cssls",
		"gopls",
		"html",
		"intelephense",
		"jsonls",
		"pyright",
		"sqls",
		"sumneko_lua",
		"texlab",
		"tsserver",
		"yamlls",
	},
	skip_setup = { "tsserver" },
	on_attach = function(client, _)
		if client.name == "null-ls" then
			client.resolved_capabilities.document_formatting = false
		end
	end,
	["server-settings"] = {
		clangd = { capabilities = { offsetEncoding = "utf-8" } },
		pyright = {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "on",
					},
				},
			},
		},
		sqls = {
			on_attach = function(client, bufnr)
				if client.name == "sqls" then
					require("sqls").on_attach(client, bufnr)
				end
			end,
		},
		texlab = {
			settings = {
				texlab = {
					build = { onSave = true },
					forwardSearch = {
						executable = "zathura",
						args = { "--synctex-forward", "%l:1:%f", "%p" },
					},
				},
			},
		},
		yamlls = {
			settings = {
				yaml = {
					schemas = {
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
					},
				},
			},
		},
	},
}
