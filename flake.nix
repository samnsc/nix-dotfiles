{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, home-manager, ... }:
    let
      configuration = import ./configuration.nix;
      brew = import ./home/brew.nix;
      fonts = import ./home/fonts.nix;
      settings = import ./settings.nix;
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Sams-MacBook-Pro
      darwinConfigurations."Sams-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          { system.configurationRevision = self.rev or self.dirtyRev or null; }
          brew
          fonts
          settings
          home-manager.darwinModules.home-manager
          {
            programs.fish.enable = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sam = import ./home/home.nix;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Sams-MacBook-Pro".pkgs;
    };
}
