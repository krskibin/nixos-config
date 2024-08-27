{
  description = "NixOS system configuration";
  inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

     home-manager = {
       url = "github:nix-community/home-manager/release-24.05";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = {nixpkgs, home-manager,  ...}:
    let 
      system = "x86_64-linux";
    in{
    nixosConfigurations.BD-1 = nixpkgs.lib.nixosSystem {
     inherit system;
     modules = [ ./nixos/configuration.nix ];
    };

    homeConfigurations.krystian = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [./home-manager/home.nix];
    };
    
  };


}
