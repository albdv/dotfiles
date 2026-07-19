local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Color scheme
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'AdventureTime'

-- Font configuration
config.font = wezterm.font('JetBrains Mono')
config.font_size = 15.0

-- Tab bar configuration
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Window appearance
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

-- Styling Inactive Panes¶
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

config.adjust_window_size_when_changing_font_size = false
config.automatically_reload_config = true
config.enable_scroll_bar = true
-- let's imagine this is endless
config.scrollback_lines = 50000

-- Keybindings
config.keys = {
  -- Split vertical (Cmd+D on Mac, Ctrl+Shift+D on Linux/Win)
  {
    key = 'd',
    mods = 'CMD', 
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Split horizontal (Cmd+Shift+D on Mac, Ctrl+Shift+E on Linux/Win)
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Close pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- jumpr word left
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  -- jump word right
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
}

-- Set the default domain for the terminal (e.g., zsh, bash, powershell)
-- Uncomment and change if you have a specific shell preference
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

return config
