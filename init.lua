vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.vscode_snippets_path = "~/.config/nvim/lua/configs/snippets/"
vim.opt.conceallevel = 2
vim.o.scrolloff = 5
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
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
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.schedule(function()
                vim.cmd("Oil")
                vim.cmd("Telescope projects")
            end)
        end
    end
})

-- Auto-reload Neovim when plugin files change
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "lua/*.lua", -- Adjust this based on your config structure
    callback = function()
        vim.cmd("luafile %")
    end,
})

vim.schedule(function()
  require "mappings"
end)
