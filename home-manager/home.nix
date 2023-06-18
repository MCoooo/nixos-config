{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/micro.nix
  ];
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  home.packages = with pkgs; [
    neovim
    firefox
    fd
    git
    ripgrep
    tree
    exa
    zoxide
    bat
    fontconfig
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    tmux
  ];
  home.stateVersion = "22.11";
}
