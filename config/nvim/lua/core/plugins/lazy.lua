plugins = {
	{"catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	{'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-treesitter/playground'},
	{'theprimeagen/harpoon'},
	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},
 	{'hrsh7th/cmp-nvim-lsp'},
 	{'hrsh7th/cmp-buffer'},
 	{'hrsh7th/cmp-path'},
 	{'hrsh7th/cmp-cmdline'},
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/cmp-vsnip'},
 	{'hrsh7th/nvim-cmp'},
    {'windwp/nvim-autopairs'},
    {'puremourning/vimspector'},
    {'windwp/nvim-ts-autotag'},
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig", -- optional
        },
        opts = {} -- your configuration
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    }
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)

--Load other plugins
require("mason").setup()
require("core.plugins.telescope")
require("core.plugins.treesitter")
require("core.plugins.harpoon")
require("core.plugins.undotree")
require("core.plugins.fugitive")
require("core.plugins.autopairs")
require("core.plugins.vimspector")
require("core.plugins.nvim_ts_autotag")
