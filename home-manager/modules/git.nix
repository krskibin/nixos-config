{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "krystian";
        email = "krskibin@gmail.com";
      };
    };

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
