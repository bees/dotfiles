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

local background = 'light'
if os.execute('defaults read -g AppleInterfaceStyle 1> /dev/null 2> /dev/null') == 0 then
  background = 'dark'
end
vim.api.nvim_set_option('background', background)

require('bees')
