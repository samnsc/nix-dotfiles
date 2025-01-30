{ pkgs, ... }:

{
  home.file = {
    ".config/ghostty/config" = {
      text = ''
        command = ${pkgs.fish}/bin/fish
      '';

      recursive = true;
    };
  };
}
