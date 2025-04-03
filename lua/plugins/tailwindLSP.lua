-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  event = { "BufReadPre *.html","BufReadPre *.js","BufReadPre *.jsx", "BufReadPre *.ts", "BufReadPre *.tsx" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    document_color = {
      enabled = false,
      debounce = 200,
    },
    conceal = {
      enabled = true,
      min_length = 80,
      symbol = "󱏿",
    }
  } -- your configuration
}
