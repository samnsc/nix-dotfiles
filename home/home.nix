{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # nix language servers and formatters
    nil
    nixd
    nixfmt-classic

    neovim

    bat
    zoxide

    raycast
  ];

  imports = [ ./ghostty.nix ];

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = { hide_env_diff = true; };
    };
    zed-editor = import ./zed.nix;
    vscode = {
      enable = true;
      enableUpdateCheck = false;
      mutableExtensionsDir = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs; [ vscode-extensions.jnoortheen.nix-ide ];
    };
    fish = {
      enable = true;
      shellAbbrs = { dwr = "darwin-rebuild switch --flake ~/.config/nix"; };
      interactiveShellInit = ''
        fish_add_path "/Applications/Little Snitch.app/Contents/Components"
        eval (/opt/homebrew/bin/brew shellenv)
        function starship_transient_prompt_func
          starship module character
        end
        function starship_transient_rprompt_func
          starship module time
        end
        starship init fish | source
        enable_transience
      '';
    };
    git = {
      enable = true;
      userName = "Samuel Nascimento";
      userEmail = "me@samnsc.com";

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg."ssh".program =
          "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        user.signingkey =
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJuerlNiBsef84YqeNO4KpaS/rO+6bqYAbl+2TSx51en";
      };
    };
    starship = { enable = true; };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
