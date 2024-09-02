{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./git.nix
    ./neovim.nix
  ];
  home.username = "guillaume";
  home.homeDirectory = "/home/guillaume";

  # Should always match nixos config
  home.stateVersion = "24.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.ripgrep
    pkgs.lua
    pkgs.php
    pkgs.nodejs
    pkgs.tree-sitter
    pkgs.ruby
    pkgs.fd
    pkgs.fzf
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    #".config/nvim".source = dotfiles/.config/nvim;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.file.".config/nvim".source = fetchTarball {
    url = "https://github.com/GuillaumeLeon/dotfiles/releases/download/1.0.0/nvim.tar.gz";
    sha256 = "072wm7gvq1fk5cd0p99a1jzglhjql7was3j1r19m8k3s535psd66";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixos/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
