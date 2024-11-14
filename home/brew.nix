{ ... }:

{
  homebrew = {
    enable = true;
    casks =
      [ # move gitbutler and whatsapp to nix package once they aren't broken
        "1password"
        "little-snitch"
        "gitbutler"
        "whatsapp"
        "setapp"
        "arc"
        "firefox"
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
