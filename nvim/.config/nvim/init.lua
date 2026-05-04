-- ~/.config/nvim/init.lua

-- Bootstrap Lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings (Leader key must be set BEFORE plugins)
require("core")

-- Load plugins
require("lazy").setup("plugins")
