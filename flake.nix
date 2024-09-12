{
  description = "NixOS system configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }@inputs :
    let 
      system = "x86_64-linux";
    in{
    nixosConfigurations.BD-1 = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [ 
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
      ];
    };

    homeConfigurations.krystian = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable { inherit system; };
      };
      modules = [./home-manager/home.nix];
    };
    
  };


}
