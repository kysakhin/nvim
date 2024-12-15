return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua-language-server", "stylua",
          "html-lsp", "css-lsp" , "prettier", "gopls"
        },
        highlight = { enable = true }
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css", "javascript", "typescript", "tsx", "rust"
        },
        highlight= {
          enable=true
        },
        indent = {
          enable = true,
        },
        auto_install = true
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua-language-server",
          "html-lsp",
          "css-lsp",
          "prettier",
          "rust-hdl"
        }
      })
    end,
  },
}
