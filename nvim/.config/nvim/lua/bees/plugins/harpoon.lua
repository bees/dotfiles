return { "theprimeagen/harpoon",
  keys = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    return {
      { "<leader>a", mark.add_file },
      { "<C-e>", ui.toggle_quick_menu },
      { "<F1>", function() ui.nav_file(1) end },
      { "<F2>", function() ui.nav_file(2) end },
      { "<F3>", function() ui.nav_file(3) end },
      { "<F4>", function() ui.nav_file(4) end },
    }
  end
}
