# NixOS config
### Based on flakes and (nixos config + home manager)

## Features

- Wayland configuration without any glitches
- Basic Hyperland setup
- Working Nixvim config
- Zen TMUX
- Catppuccin Themed

**Tested on AMD CPU and Intel GPU**

## Installation
1. Edit `/etc/nixos/configuration.nix` file and add `nix.settings.experimental-features = ["nix-command" "flakes"];` line to the file
2. Git clone project to your home directory `git clone https://github.com/krskibin/nixos-config`
3. Copy `hardware-configuration.nix` to the repository `cp /etc/nixos/hardware-configuration.nix ~/nixos-config/nixos/.`
4. Edit `boot.initrd.luks.devices` line in the repo `nixos-config/nixos/configuration.nix` file to match the same line from your generated `configuration.nix` file
5. Run `sudo nixos-rebuild switch --flake ./nixos-config#BD-1` from your home directory -> wait a moment to download all of the needed packages
6. Run `home-manager switch flake ./nixos-config`

Please follow each step carefully. Missing any step can result in a damaged operating system."
## Useful commands

**Using aliases**

Update flakes
```bash
upd

```

Upgrade flakes
```bash
upg
```

Rebuild NixOS
```bash
rb
```

Rebuild homemanager
```bash
hms
```
## Hyperland Keybinds
mainMod -> WinKey sometimes called Super  
"$mainMod, Q, killactive," - translates to - WinKey + Q - kill active window

```bash
"$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

"$mainMod, Return, exec, wezterm"
"$mainMod, Q, killactive,"
"$mainMod, M, exit,"
"$mainMod, E, exec, thunar"
"$mainMod, F, togglefloating,"
"$mainMod, D, exec, fuzzel --show drun"
"$mainMod, P, pseudo, # dwindle"
"$mainMod, J, togglesplit, # dwindle"
"$mainMod, L, exec, hyprlock"

# Move focus with mainMod + arrow keys
"$mainMod, left,  movefocus, l"
"$mainMod, right, movefocus, r"
"$mainMod, up,    movefocus, u"
"$mainMod, down,  movefocus, d"

# Moving windows
"$mainMod SHIFT, left,  swapwindow, l"
"$mainMod SHIFT, right, swapwindow, r"
"$mainMod SHIFT, up,    swapwindow, u"
"$mainMod SHIFT, down,  swapwindow, d"

# Window resizing                     X  Y
"$mainMod CTRL, left,  resizeactive, -60 0"
"$mainMod CTRL, right, resizeactive,  60 0"
"$mainMod CTRL, up,    resizeactive,  0 -60"
"$mainMod CTRL, down,  resizeactive,  0  60"

# Switch workspaces with mainMod + [0-9]
"$mainMod, 1, workspace, 1"
"$mainMod, 2, workspace, 2"
"$mainMod, 3, workspace, 3"
"$mainMod, 4, workspace, 4"
"$mainMod, 5, workspace, 5"
"$mainMod, 6, workspace, 6"
"$mainMod, 7, workspace, 7"
"$mainMod, 8, workspace, 8"
"$mainMod, 9, workspace, 9"
"$mainMod, 0, workspace, 10"

# Move active window to a workspace with mainMod + SHIFT + [0-9]
"$mainMod SHIFT, 1, movetoworkspacesilent, 1"
"$mainMod SHIFT, 2, movetoworkspacesilent, 2"
"$mainMod SHIFT, 3, movetoworkspacesilent, 3"
"$mainMod SHIFT, 4, movetoworkspacesilent, 4"
"$mainMod SHIFT, 5, movetoworkspacesilent, 5"
"$mainMod SHIFT, 6, movetoworkspacesilent, 6"
"$mainMod SHIFT, 7, movetoworkspacesilent, 7"
"$mainMod SHIFT, 8, movetoworkspacesilent, 8"
"$mainMod SHIFT, 9, movetoworkspacesilent, 9"
"$mainMod SHIFT, 0, movetoworkspacesilent, 10"

# Scroll through existing workspaces with mainMod + scroll
"$mainMod, mouse_down, workspace, e+1"
"$mainMod, mouse_up, workspace, e-1"

# Keyboard backlight
"$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
"$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

# Volume and Media Control
", XF86AudioRaiseVolume, exec, pamixer -i 5 "
", XF86AudioLowerVolume, exec, pamixer -d 5 "
", XF86AudioMute, exec, pamixer -t"
", XF86AudioMicMute, exec, pamixer --default-source -t"

# Brightness control
", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
", XF86MonBrightnessUp, exec, brightnessctl set +5% "

# Configuration files
''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
''$mainMod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/hyprland.nix"''
''$mainMod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/waybar.nix''
'', Print, exec, grim -g "$(slurp)" - | swappy -f -''

# Waybar
"$mainMod, B, exec, pkill -SIGUSR1 waybar"
"$mainMod, W, exec, pkill -SIGUSR2 waybar"

# Disable all effects
"$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
```
