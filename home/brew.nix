{ ... }:

{
  homebrew = {
    enable = true;
    # move gitbutler and whatsapp to nix package once they aren't broken
    casks =
      [
        "1password"
        "little-snitch"
        "gitbutler"
        "whatsapp"
        "ghostty"
        "arc"
      ];
    masApps = { # adds mas to brews
      Xcode = 497799835;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
