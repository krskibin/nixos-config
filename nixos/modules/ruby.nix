{nixpkgs-ruby, pkgs, ... }:

{
  programs.ruby.enable = true;
  programs.ruby.package = nixpkgs-ruby.packages.${pkgs.system}."ruby-3.3.5";
}
