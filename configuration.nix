{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.sam = {
    name = "sam";
    home = "/Users/sam";
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };
  system.stateVersion = 5;
}
