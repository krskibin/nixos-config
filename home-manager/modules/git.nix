{
  programs.git = {
    enable = true;
    userName = "krystian";
    userEmail = "krskibin@gmail.com";

    ignores = [
      "**/.envrc"  
      "**/.direnv"
      "**/shell.nix"
      "**/dump.rdb"
      "**/.history"
      "**/flake.nix"
      "**/flake.lock"
      "**/gemset.nix"
    ];
  };
}
