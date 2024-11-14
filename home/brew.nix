{ ... }:

{
  homebrew = {
    enable = true;
    # brews = [ "mas" ];
    # move gitbutler and whatsapp to nix package once they aren't broken
    casks =
      [ "1password" "little-snitch" "gitbutler" "whatsapp" "setapp" "arc" ];
    masApps = {
      Xcode = 497799835;
      # "Little Snitch Mini" = 1629008763;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
