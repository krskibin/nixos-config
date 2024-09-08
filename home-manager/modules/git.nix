{
  programs.git = {
    enable = true;
    userName = "krystian";
    userEmail = "krskibin@gmail.com";

    ignores = [
      "**/.envrc"  
      "**/.direnv"
      "**/shell.nix"
      "**/gemset.nix"
      "**/dump.rdb"
      "**/.history"
    ];
  };
}
