{ pkgs, ... }:

{
  security.pam.enableSudoTouchIdAuth = true;

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;

    tilesize = 32;
    magnification = true;
    largesize = 45;

    showhidden = true;

    persistent-apps = [
      "/System/Applications/Messages.app"
      "/Applications/WhatsApp.app"
      "/Applications/Arc.app"
      "${pkgs.iterm2}/Applications/iTerm2.app"
      "/Applications/GitButler.app"
      "${pkgs.zed-editor}/Applications/Zed.app"
      "/Applications/Xcode.app"
    ];
  };

  system.defaults.finder = {
    ShowHardDrivesOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    NewWindowTarget = "Home";
    ShowPathbar = true;
    ShowStatusBar = true;
  };

  system.defaults.CustomUserPreferences = {
    NSGlobalDomain = { AppleAccentColor = 5; };
    "com.apple.Siri" = { StatusMenuVisible = 0; };
  };
}
