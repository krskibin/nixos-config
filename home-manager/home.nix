{ pkgs, ...}:
{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "krystian";
    homeDirectory = "/home/krystian";
    stateVersion = "24.05";
    sessionVariables = {
      TERMINAL = "${pkgs.wezterm}/bin/wezterm";
    };
  };
}
