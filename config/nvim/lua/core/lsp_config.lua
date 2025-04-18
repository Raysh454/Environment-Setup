require("mason-lspconfig").setup({
	ensure_installed = {"pyright", "lua_ls", "clangd", "java_language_server", "eslint",  "rust_analyzer", "nimls", "zls", "gopls", "omnisharp", "ts_ls", "cssls"},
    log_level = vim.log.levels.DEBUG
})

local cmp = require('cmp')
local cmp_autopairs = require("nvim-autopairs.completion.cmp");

-- diagnostic messages
vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            return diagnostic.message
        end
    }
})


cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
        { name = 'buffer' },
        { name = 'path' }
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').pyright.setup {
	capabilities = capabilities
}
require('lspconfig').lua_ls.setup {
	capabilities = capabilities
}
require('lspconfig').clangd.setup {
	capabilities = capabilities
}
require('lspconfig').java_language_server.setup {
  capabilities = capabilities
}
require('lspconfig').eslint.setup {
    capabilities = capabilities
}
require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    filetype = {"rust"},
})
require('lspconfig').nimls.setup({
    capabilities = capabilities,
})
require('lspconfig').zls.setup({
    capabilities = capabilities,
})
require('lspconfig').gopls.setup({
    capabilities = capabilities,
})
require('lspconfig').omnisharp.setup({
    capabilities = capabilities,
})
require('lspconfig').ts_ls.setup({
    capabilities = capabilities,
})
require('lspconfig').cssls.setup({
    capabilities = capabilities,
})
