vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- vim options ig
vim.opt.relativenumber = true
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
-- open where it left off
-- Check if autocmd is supported
if vim.fn.has("autocmd") == 1 then
  -- Set up an autocmd to jump to the last cursor position
  vim.api.nvim_create_augroup("RememberCursor", { clear = true })
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = "RememberCursor",
    pattern = "*",
    callback = function()
      local last_pos = vim.api.nvim_buf_get_mark(0, '"')
      if last_pos[1] > 0 and last_pos[1] <= vim.api.nvim_buf_line_count(0) then
        vim.api.nvim_command("normal! g'\"")
      end
    end,
  })
end

-- quality of life upgrades
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap= true, silent= true})
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap= true, silent= true})
vim.keymap.set('n', '}', '}zz', { noremap= true, silent= true})
vim.keymap.set('n', '{', '{zz', { noremap= true, silent= true})
vim.keymap.set('i', '<C-CR>', '<ESC>o', { noremap=true, silent=true } )

-- require('autocomp')

-- Trying to read ejs as html files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.ejs",
  command = "set filetype=html"
})
