if (io.popen("uname -s"):read '*a'):match 'Darwin' then
    if (io.popen('defaults read -g AppleInterfaceStyle'):read '*a'):match 'Dark' then
        vim.api.nvim_set_option('background', 'dark')
      else
        vim.api.nvim_set_option('background', 'light')
    end
end
require('bees')
