{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      username = "nk";
    in
    {
      darwinConfigurations = {
        shinobu = inputs.nix-darwin.lib.darwinSystem {
          pkgs = import inputs.nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
          };
          modules = [
            ./hosts/shinobu/configuration
            inputs.home-manager.darwinModules.home-manager
            ./hosts/shinobu/home-manager.nix
          ];
          specialArgs = {
            inherit inputs;
            inherit username;
          };
        };
      };
      homeConfigurations = {
        suruga = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = [
            ./hosts/suruga/home.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit username;
          };
        };
      };
    };
}
