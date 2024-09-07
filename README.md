# NixOS config
### Based on flakes and (nixos config + home manager)

> Zen Browser included :joy:

## Features

- Wayland configuration without any glitches
- Basic Hyperland setup
- Working Nixvim config

**Tested on AMD CPU and Intel GPU**

## Installation
1. Edit `/etc/nixos/configuration.nix` file and add `nix.settings.experimental-features = ["nix-command" "flakes"];` line to the file
2. Git clone project to your home directory `git clone https://github.com/krskibin/nixos-config`
3. Copy `hardware-configuration.nix` to the repository `cp /etc/nixos/hardware-configuration.nix ~/nixos-config/nixos/.`
4. Edit `boot.initrd.luks.devices` line in the repo `nixos-config/nixos/configuration.nix` file to match the same line from your generated `configuration.nix` file
5. Run `sudo nixos-rebuild switch --flake ./nixos-config#BD-1` from your home directory -> wait a moment to download all of the needed packages
6. Run `home-manager switch flake ./nixos-config`

Please follow each step carefully. Missing any step can result in a damaged operating system."
## Usage 

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
