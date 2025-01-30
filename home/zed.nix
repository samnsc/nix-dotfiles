{
  enable = true;

  extensions = [ "nix" "Xcode Themes" ];

  userSettings = {
    languages = {
      Nix = {
        language_servers = [ "nil" "!nixd" ];
        formatter = { external = { command = "nixfmt"; }; };
      };
    };
  };
}
