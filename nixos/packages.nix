{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    audacity
    google-chrome
    obs-studio
    rofi
    wofi
    mpv
    kdenlive
    discord
    gparted
    obsidian
    zoom-us
    vscode
    wezterm
    slack

    # Coding stuff
    nodejs
    python
    ruby

    # CLI utils
    neovim
    neofetch
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    unzip
    scrot
    mediainfo
    ranger
    zip
    openssl
    swww
    bluez
    bluez-tools
    heroku

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # WMs and stuff
    hyprland
    xdg-desktop-portal-hyprland
    waybar

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    amdvlk
    rocm-opencl-icd
    glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
