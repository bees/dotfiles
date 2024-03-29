local uis = vim.api.nvim_list_uis()
if (uis == nil or uis[1] == nil) then
  return {}
end

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 60
local height = 20

return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = {
   -- {"nvim-tree/nvim-web-devicons", name = "nvim-tree/nvim-web-devicons"},
  },
  opts = {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = false,

    view = {
      width = width,
      float = {
        enable = true,
        open_win_config = {
          relative = "editor",
          width = width,
          height = height,
          row = (gheight - height) * 0.4,
          col = (gwidth - width) * 0.5,
        }
      }
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":t",
      indent_markers = {
        enable = true,
        icons = {
          corner = "└",
          edge = "│",
          none = "",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "signcolumn",
        padding = " ",
        symlink_arrow = "  ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "",
            staged = "ﰶ",
            unmerged = "",
            renamed = "➜",
            untracked = "●",
            deleted = "﯀",
            ignored = "",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = "",
      args = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
    },
    filters = {
      dotfiles = false,
      custom = {
        "^.git$",
      },
      exclude = {},
    },
    git = {
      enable = false,
      ignore = false,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = true,
        resize_window = true,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  },
  keys = {
    { "<leader>e", vim.cmd.NvimTreeFindFileToggle }
  }
}
